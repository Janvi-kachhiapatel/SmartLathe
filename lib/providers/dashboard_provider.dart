import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {

  Map<String, dynamic> dashboard = {};

  void update(Map<String, dynamic> data) {
    dashboard = data;
    notifyListeners();
  }
}