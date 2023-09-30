import 'package:go_router/go_router.dart';
import 'package:workout_app/src/features/authentication/presentation/screens/welcome.dart';
import 'package:workout_app/views/height_screen.dart';
import 'package:workout_app/views/questions_screen.dart';

import '../../views/about.dart';
import '../../views/app.dart';
import '../../views/weight_screen.dart';
import '../features/authentication/presentation/screens/login.dart';
import '../features/authentication/presentation/screens/signup_screen.dart';
class Routing{
  // GoRouter configuration
  static final  router = GoRouter(
    initialLocation: '/welcome',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/home/:uid',
        builder: (context, state) => Application(uid: state.pathParameters['uid']!,),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => Welcome(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/about/:uid',
        builder: (context, state) {
          return About(uid: state.pathParameters['uid']!,);
        },
      ),

      GoRoute(
        path: '/height/:uid',
        builder: (context, state) {
          return HeightScreen(uid: state.pathParameters['uid']!,);
        },
      ),

      GoRoute(
        path: '/weight/:uid',
        builder: (context, state) {
          return WeightScreen(uid: state.pathParameters['uid']!,);
        },
      ),
      GoRoute(
        path: '/questions/:uid',
        builder: (context, state) {
          return QuestionScreen(uid:state.pathParameters['uid']!,);
        },
      ),






    ],
  );

}
