// import 'package:flutter/material.dart';

// import '../models/machining_result.dart';
// import '../services/machining_service.dart';

// class MachiningProvider extends ChangeNotifier {

//   MachiningResult? result;

//   bool calculating = false;

//   Future<void> calculate({

//     required String material,
//     required String tool,
//     required String operation,
//     required double diameter,
//     required double length,

//   }) async {

//     calculating = true;

//     notifyListeners();

//     result =
//         MachiningService.calculate(

//       material: material,
//       tool: tool,
//       operation: operation,
//       diameter: diameter,
//       length: length,

//     );

//     calculating = false;

//     notifyListeners();
//   }

// }
import 'package:flutter/material.dart';

class MachiningProvider extends ChangeNotifier {

  double rpm = 0;
  double feed = 0;
  double speed = 0;
  double depth = 0;

  void update({
    required double rpm,
    required double feed,
    required double speed,
    required double depth,
  }) {

    this.rpm = rpm;
    this.feed = feed;
    this.speed = speed;
    this.depth = depth;

    notifyListeners();
  }
}