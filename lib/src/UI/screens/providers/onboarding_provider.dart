import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;

  late final PageController _pageController;

  void init() {
    _pageController = PageController();
  }

  int get getCurrentPage => _currentPage;
  PageController get pageController => _pageController;

  set currentPage(int page) {
    _currentPage = page;
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );

    notifyListeners();
  }
}
