import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout_app/src/core/routing.dart';
import 'package:workout_app/src/features/authentication/presentation/screens/welcome.dart';
import 'package:workout_app/style/styling.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp.router(
      title: 'Workout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Aeonik',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.tColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Define app routes and initial route
      routerConfig: Routing.router,
    );
  }
}



