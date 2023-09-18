import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  int get getCurrentPage => _currentPage;
  PageController get pageController => _pageController;

  void updateCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}