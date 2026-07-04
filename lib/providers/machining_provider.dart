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
// import 'package:flutter/material.dart';
// import '../models/machining_model.dart';
// import '../services/machining_service.dart';


// class MachiningProvider extends ChangeNotifier {
//   MachiningResult? result;

//   String tool = "HSS";
//   String material = "Mild Steel";
//   String operation = "Turning";

//   double diameter = 0;
//   bool finishing = false;

//   void setTool(String value) {
//     tool = value;
//     notifyListeners();
//   }

//   void setMaterial(String value) {
//     material = value;
//     notifyListeners();
//   }

//   void setOperation(String value) {
//     operation = value;
//     notifyListeners();
//   }

//   void setDiameter(double value) {
//     diameter = value;
//     notifyListeners();
//   }

//   void setFinishing(bool value) {
//     finishing = value;
//     notifyListeners();
//   }

//   void calculate() {
//     if (diameter == 0) return;

//     result = MachiningService.calculate(
//       tool: tool,
//       material: material,
//       diameter: diameter,
//       finishing: finishing,
//       operation: operation,
//     );

//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import '../models/machining_model.dart';
import '../services/machining_service.dart';

class MachiningProvider extends ChangeNotifier {
  MachiningResult? result;

  String tool = "HSS";
  String material = "Mild Steel";

  // kept only for UI display (NOT used in calculation)
  String operation = "Turning";

  double diameter = 0;
  bool finishing = false;

  // ---------------- SETTERS ----------------

  void setTool(String value) {
    tool = value;
    notifyListeners();
  }

  void setMaterial(String value) {
    material = value;
    notifyListeners();
  }

  void setOperation(String value) {
    operation = value;
    notifyListeners();
  }

  void setDiameter(double value) {
    diameter = value;
    notifyListeners();
  }

  void setFinishing(bool value) {
    finishing = value;
    notifyListeners();
  }

  // ---------------- CALCULATION ----------------

  void calculate() {
    if (diameter <= 0) return;

    try {
      result = MachiningService.calculate(
  material: material,
  tool: tool,
  operation: operation,
  diameter: diameter,
  finishing: finishing,
);

      notifyListeners();
    } catch (e) {
      debugPrint("Machining calculation error: $e");
    }
  }

  // ---------------- RESET (OPTIONAL BUT USEFUL) ----------------

  void reset() {
    result = null;
    tool = "HSS";
    material = "Mild Steel";
    operation = "Turning";
    diameter = 0;
    finishing = false;

    notifyListeners();
  }
}