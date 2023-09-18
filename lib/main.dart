import 'package:flutter/material.dart';
import 'package:libro_verse/config/router/app_router.dart';
import 'package:libro_verse/src/UI/screens/providers/onboarding_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()..init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRouter.onBoardingRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
