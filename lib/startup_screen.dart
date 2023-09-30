// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:workout_app/src/features/authentication/data/data_sources/firebase_authentication_data_source.dart';
// import 'package:workout_app/src/features/authentication/data/repositories/firebase_repository_implementation.dart';
// import 'package:workout_app/src/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
// import 'package:workout_app/src/features/authentication/presentation/blocs/authentication/authentication_state.dart';
// import 'package:workout_app/src/features/authentication/presentation/screens/home.dart';
// import 'package:workout_app/src/features/authentication/presentation/screens/welcome.dart';
//
// class StartupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthenticationBloc, AuthenticationState>(
//       bloc:  AuthenticationBloc(
//         repository: AuthenticationRepositoryImplementation(FirebaseAuthenticationDataSource()),
//       ),
//       listener: (context, state) {
//       if (state is AuthenticationSuccess) {
//         // Navigate to the home screen on successful authentication
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Home(), // Replace with your home screen widget
//           ),
//         );
//       }
//     },
//       child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//
//         builder: (context, state) {
//           if (state is AuthenticationInitial) {
//             // Authentication state is still loading, show a loading indicator
//             return Welcome();
//           } else {
//             // User is not authenticated, navigate to the authentication/sign-in screen
//             return Welcome();
//           }
//         },
//       ),
//     );
//   }
// }
