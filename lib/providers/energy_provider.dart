import 'package:flutter/material.dart';

class EnergyProvider extends ChangeNotifier {

  Map<String, dynamic> energy = {};

  void update(Map<String, dynamic> data) {
    energy = data;
    notifyListeners();
  }
}