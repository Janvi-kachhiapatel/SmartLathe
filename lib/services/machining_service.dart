// // import 'dart:math';

// // import '../data/cutting_speed_table.dart';
// // import '../data/feed_table.dart';
// // import '../models/machining_model.dart';

// // class MachiningService {

// //   static MachiningResult calculate({

// //   required String material,
// //   required String tool,
// //   required double diameter,
// //   required bool finishing,

// // }) {

// //   final operation =
// //       finishing ? "Finishing" : "Roughing";

// //   //---------------------------------------------------
// //   // Cutting Speed
// //   //---------------------------------------------------
  
// //   double speed =
// //       CuttingSpeedTable.getCuttingSpeed(

// //     material: material,

// //     tool: tool,

// //     operation: operation,

// //   );

// //   //---------------------------------------------------
// //   // Feed
// //   //---------------------------------------------------

// //   double feed =
// //       FeedTable.getFeed(

// //     material: material,

// //     operation: operation,

// //   );

// //   //---------------------------------------------------
// //   // Depth Of Cut
// //   //---------------------------------------------------

// //   double doc =
// //       finishing ? 0.5 : 2.0;

// //   //---------------------------------------------------
// //   // RPM
// //   //---------------------------------------------------

// //   double rpm =
// //       (1000 * speed) /
// //           (pi * diameter);

// //   //---------------------------------------------------
// //   // Material Removal Rate
// //   //---------------------------------------------------

// //   double mrr =
// //       pi *
// //       diameter *
// //       feed *
// //       doc *
// //       rpm /
// //       1000;

// //   //---------------------------------------------------
// //   // Estimated Machining Length
// //   //---------------------------------------------------

// //   const double jobLength = 100;

// //   //---------------------------------------------------
// //   // Machining Time
// //   //---------------------------------------------------

// //   double machiningTime =
// //       jobLength /
// //       (feed * rpm);

// //   return MachiningResult(

// //     speed: speed,

// //     feed: feed,

// //     rpm: rpm,

// //     doc: doc,

// //     machiningTime: machiningTime,

// //     mrr: mrr,

// //   );

// // }

// // }
// import 'dart:math';

// import '../data/cutting_speed_table.dart';
// import '../data/feed_table.dart';
// import '../models/machining_model.dart';

// class MachiningService {

//   static MachiningResult calculate({

//     required String material,
//     required String tool,
//     required double diameter,
//     required bool finishing,

//   }) {

//     final operation =
//         finishing ? "Finishing" : "Roughing";

//     double speed =
//         CuttingSpeedTable.getCuttingSpeed(
//       material: material,
//       tool: tool,
//       operation: operation,
//     );

//     double feed =
//         FeedTable.getFeed(
//       material: material,
//       operation: operation,
//     );

//     double doc =
//         finishing ? 0.5 : 2.0;

//     double rpm =
//         (1000 * speed) / (pi * diameter);

//     double mrr =
//         pi * diameter * feed * doc * rpm / 1000;

//     const double jobLength = 100;

//     double machiningTime =
//         jobLength / (feed * rpm);

//     return MachiningResult(
//       speed: speed,
//       feed: feed,
//       rpm: rpm,
//       doc: doc,
//       machiningTime: machiningTime,
//       mrr: mrr,
//     );
//   }
// }

import 'dart:math';

import '../data/industrial_machining_database.dart';
import '../models/machining_model.dart';

class MachiningService {
  static MachiningResult calculate({
    required String material,
    required String tool,
    required double diameter,
    required bool finishing,
  }) {
    //------------------------------------------------------------
    // Select Operation
    //------------------------------------------------------------

    final operation = finishing ? "Finishing" : "Roughing";

    //------------------------------------------------------------
    // Read Database
    //------------------------------------------------------------

    final data = IndustrialMachiningDatabase
        .database[material]![tool]![operation];

    final double minSpeed =
        data["speedMin"].toDouble();

    final double maxSpeed =
        data["speedMax"].toDouble();

    final double minFeed =
        data["feedMin"].toDouble();

    final double maxFeed =
        data["feedMax"].toDouble();

    final double doc =
        data["doc"].toDouble();

    //------------------------------------------------------------
    // Average Recommended Values
    //------------------------------------------------------------

    final double speed =
        (minSpeed + maxSpeed) / 2;

    final double feed =
        (minFeed + maxFeed) / 2;

    //------------------------------------------------------------
    // RPM
    // Formula:
    // RPM=(1000×Vc)/(π×D)
    //------------------------------------------------------------

    final double rpm =
        (1000 * speed) /
            (pi * diameter);

    //------------------------------------------------------------
    // RPM Range
    //------------------------------------------------------------

    final double minRPM =
        (1000 * minSpeed) /
            (pi * diameter);

    final double maxRPM =
        (1000 * maxSpeed) /
            (pi * diameter);

    //------------------------------------------------------------
    // Assume Job Length
    //------------------------------------------------------------

    const double jobLength = 100.0; // mm

    //------------------------------------------------------------
    // Feed Speed
    //------------------------------------------------------------

    final double feedSpeed =
        feed * rpm;

    //------------------------------------------------------------
    // Machining Time
    //------------------------------------------------------------

    final double machiningTime =
        jobLength / feedSpeed;

    //------------------------------------------------------------
    // Material Removal Rate
    //------------------------------------------------------------

    final double mrr =
        speed * feed * doc;

    //------------------------------------------------------------
    // AI Recommendation
    //------------------------------------------------------------

    String recommendation =
        "Recommended parameters are within industrial limits.";

    bool safe = true;

    if (diameter < 10) {
      recommendation =
          "Small diameter detected. Use light feed and shallow depth of cut.";
    }

    if (diameter > 150) {
      recommendation =
          "Large workpiece detected. Ensure rigid clamping.";
    }

    if (rpm > maxRPM) {
      recommendation =
          "Calculated RPM exceeds safe limit.";
      safe = false;
    }

    if (rpm < minRPM) {
      recommendation =
          "Calculated RPM is below recommended range.";
      safe = false;
    }

    //------------------------------------------------------------
    // Return Result
    //------------------------------------------------------------

    return MachiningResult(
      cuttingSpeed: speed,
      feedRate: feed,
      spindleRPM: rpm,
      depthOfCut: doc,
      machiningTime: machiningTime,
      materialRemovalRate: mrr,
      minSpeed: minSpeed,
      maxSpeed: maxSpeed,
      minFeed: minFeed,
      maxFeed: maxFeed,
      minRPM: minRPM,
      maxRPM: maxRPM,
      recommendation: recommendation,
      safe: safe,
    );
  }
}