import 'package:flutter/material.dart';

class AdminDrawerIndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  
  void _setCurrentIndex({required int newIndex})async {
    currentIndex = newIndex;
    notifyListeners();
  }
}
