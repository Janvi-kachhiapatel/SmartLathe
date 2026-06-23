import 'package:flutter/material.dart';

class ComparisonService {
  static Color compareRPM(
      double recommended,
      double actual) {

    final error =
        ((recommended - actual).abs() / recommended) * 100;

    if (error < 5) {
      return Colors.green;
    }

    if (error < 10) {
      return Colors.orange;
    }

    return Colors.red;
  }
}