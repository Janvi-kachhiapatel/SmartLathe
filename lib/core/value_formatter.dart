import 'units.dart';

class ValueFormatter {
  static String rpm(double value) {
    return "${value.toStringAsFixed(0)} ${Units.rpm}";
  }

  static String speed(double value) {
    return "${value.toStringAsFixed(1)} ${Units.cuttingSpeed}";
  }

  static String feed(double value) {
    return "${value.toStringAsFixed(2)} ${Units.feed}";
  }

  static String diameter(double value) {
    return "${value.toStringAsFixed(1)} ${Units.diameter}";
  }

  static String doc(double value) {
    return "${value.toStringAsFixed(1)} ${Units.doc}";
  }

  static String vibration(double value) {
    return "${value.toStringAsFixed(2)} ${Units.vibration}";
  }

  static String temperature(double value) {
    return "${value.toStringAsFixed(1)} ${Units.temperature}";
  }

  static String power(double value) {
    return "${value.toStringAsFixed(2)} ${Units.power}";
  }

  static String mrr(double value) {
    return "${value.toStringAsFixed(2)} ${Units.mrr}";
  }

  static String machiningTime(double value) {
    return "${value.toStringAsFixed(2)} ${Units.machiningTime}";
  }
}