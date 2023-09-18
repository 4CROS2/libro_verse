import 'package:flutter/material.dart';
import 'package:libro_verse/src/UI/screens/screens.dart';

class AppRouter{

  static const String loginRoute = '/login';
  static const String onBoardingRoute = '/onboarding';
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());;
      default:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    }
  }

}