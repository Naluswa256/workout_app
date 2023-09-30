import 'package:flutter/material.dart';
import 'package:workout_app/src/features/authentication/presentation/screens/signup_screen.dart';
import 'package:workout_app/style/styling.dart';
import 'package:workout_app/style/text.dart';
import 'package:workout_app/views/about.dart';
import 'package:workout_app/widget/bodyText.dart';
import 'package:workout_app/widget/button.dart';
import 'package:workout_app/widget/header.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../startup_screen.dart';
import '../../data/data_sources/firebase_authentication_data_source.dart';
import '../../data/repositories/firebase_repository_implementation.dart';
import '../../data/repositories/firebase_storage_repository.dart';
import '../blocs/authentication/authentication_bloc.dart';
import '../blocs/authentication/authentication_event.dart';
import '../blocs/authentication/authentication_state.dart';
import 'home.dart';
import 'package:go_router/go_router.dart';
class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _isLoaderVisible = false;
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // You can add additional email format validation if needed
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Invalid email format';
    }
    return null; // Validation passed
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null; // Validation passed
  }

  void handleFormSubmission(BuildContext context, GlobalKey<FormBuilderState> formKey) {
    if (formKey.currentState!.saveAndValidate()) {
      final email = formKey.currentState!.fields['email']!.value as String;
      final password = formKey.currentState!.fields['password']!.value as String;
      BlocProvider.of<AuthenticationBloc>(context).add(SignInEvent(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          // Include the AuthenticationBloc provider here
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
              repository: AuthenticationRepositoryImplementation(FirebaseAuthenticationDataSource(), FirestoreRepositoryImplementation()),
            ),
          ),
          // Add any other BlocProviders your SignInScreen may need
        ],
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              // Navigate to the home screen on successful authentication
              context.go('/');
            }else if(state is AuthenticationLoading){
              context.loaderOverlay.show();
              setState(() {
                _isLoaderVisible = context.loaderOverlay.visible;
              });

            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationError) {
                return _buildErrorDialog(context, state.errorMessage);
              } else{
                return LoaderOverlay(
                  useDefaultLoading: false,
                  overlayColor: AppColor.sColor,
                  overlayOpacity: 0.2,
                  overlayWidget: Center(
                    child: SpinKitCubeGrid(
                      color: AppColor.pColor,
                      size: 50.0,

                    ),

                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.8,
                                child: Image.asset(
                                  'assets/images/login.png',
                                  fit: BoxFit.fill,
                                )),
                            Image.asset(
                              'assets/images/Rectangle.png',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: SafeArea(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: PadRadius.horizontal - 15),
                                  child: Column(
                                    children: [
                                      Expanded(flex: 5, child: Header()),
                                      Expanded(
                                        flex: 5,
                                        child: BodyText(
                                          bodyTxt: ltitle,
                                          isBold: true,
                                          desc: wbody,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: FormBuilder(
                                          key: _formKey,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                FormBuilderTextField(
                                                  name: 'email',
                                                  decoration: InputDecoration(labelText: 'Email'),
                                                  validator: emailValidator
                                                ),
                                                FormBuilderTextField(
                                                  name: 'password',
                                                  decoration: InputDecoration(labelText: 'Password'),
                                                  obscureText: true,
                                                  validator:passwordValidator,
                                                ),
                                                SizedBox(height: 30),
                                                Text(lbody3)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Button(
                                              border: false,
                                              btnTxt: lbody4,
                                              onTap: () {
                                                handleFormSubmission(context, _formKey);
                                              },
                                              borderColor: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Button(
                                              border: true,
                                              btnTxt: lbody5,
                                              borderColor: AppColor.pColor,
                                              onTap: () => context.go('/signup'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorDialog(BuildContext context, String errorMessage) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(errorMessage),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
