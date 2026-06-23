import 'package:flutter/material.dart';

class AlarmProvider extends ChangeNotifier {

  List alarms = [];

  void update(List list) {
    alarms = list;
    notifyListeners();
  }
}