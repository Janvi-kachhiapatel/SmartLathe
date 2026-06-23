import 'package:flutter/material.dart';

class VibitProvider extends ChangeNotifier {

  Map<String, dynamic> vibit = {};

  void update(Map<String, dynamic> data) {
    vibit = data;
    notifyListeners();
  }
}