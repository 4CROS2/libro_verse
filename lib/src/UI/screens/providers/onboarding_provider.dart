import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;

  int get getCurrentPage => _currentPage;

  void updateCurrentPage(int page) {
    if (page < 0 || page > 2) return;
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}