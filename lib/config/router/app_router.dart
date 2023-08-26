import 'package:flutter/material.dart';
import 'package:libro_verse/src/views/screens/screens.dart';

class AppRouter{

  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String onBoardingRoute = '/onboarding';
  static const String homeRoute = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }

}