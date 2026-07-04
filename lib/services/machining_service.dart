// <<<<<<< HEAD
// <<<<<<< HEAD
// =======
// >>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
// // // import 'dart:math';

// // // import '../data/cutting_speed_table.dart';
// // // import '../data/feed_table.dart';
// // // import '../models/machining_model.dart';

// // // class MachiningService {

// // //   static MachiningResult calculate({

// // //   required String material,
// // //   required String tool,
// // //   required double diameter,
// // //   required bool finishing,

// // // }) {

// // //   final operation =
// // //       finishing ? "Finishing" : "Roughing";

// // //   //---------------------------------------------------
// // //   // Cutting Speed
// // //   //---------------------------------------------------
  
// // //   double speed =
// // //       CuttingSpeedTable.getCuttingSpeed(

// // //     material: material,

// // //     tool: tool,

// // //     operation: operation,

// // //   );

// // //   //---------------------------------------------------
// // //   // Feed
// // //   //---------------------------------------------------

// // //   double feed =
// // //       FeedTable.getFeed(

// // //     material: material,

// // //     operation: operation,

// // //   );

// // //   //---------------------------------------------------
// // //   // Depth Of Cut
// // //   //---------------------------------------------------

// // //   double doc =
// // //       finishing ? 0.5 : 2.0;

// // //   //---------------------------------------------------
// // //   // RPM
// // //   //---------------------------------------------------

// // //   double rpm =
// // //       (1000 * speed) /
// // //           (pi * diameter);

// // //   //---------------------------------------------------
// // //   // Material Removal Rate
// // //   //---------------------------------------------------

// // //   double mrr =
// // //       pi *
// // //       diameter *
// // //       feed *
// // //       doc *
// // //       rpm /
// // //       1000;

// // //   //---------------------------------------------------
// // //   // Estimated Machining Length
// // //   //---------------------------------------------------

// // //   const double jobLength = 100;

// // //   //---------------------------------------------------
// // //   // Machining Time
// // //   //---------------------------------------------------

// // //   double machiningTime =
// // //       jobLength /
// // //       (feed * rpm);

// // //   return MachiningResult(

// // //     speed: speed,

// // //     feed: feed,

// // //     rpm: rpm,

// // //     doc: doc,

// // //     machiningTime: machiningTime,

// // //     mrr: mrr,

// // //   );

// // // }

// // // }
// // import 'dart:math';

// // import '../data/cutting_speed_table.dart';
// // import '../data/feed_table.dart';
// // import '../models/machining_model.dart';

// // class MachiningService {

// //   static MachiningResult calculate({

// //     required String material,
// //     required String tool,
// //     required double diameter,
// //     required bool finishing,

// //   }) {

// //     final operation =
// //         finishing ? "Finishing" : "Roughing";

// //     double speed =
// //         CuttingSpeedTable.getCuttingSpeed(
// //       material: material,
// //       tool: tool,
// //       operation: operation,
// //     );

// //     double feed =
// //         FeedTable.getFeed(
// //       material: material,
// //       operation: operation,
// //     );

// //     double doc =
// //         finishing ? 0.5 : 2.0;

// //     double rpm =
// //         (1000 * speed) / (pi * diameter);

// //     double mrr =
// //         pi * diameter * feed * doc * rpm / 1000;

// //     const double jobLength = 100;

// //     double machiningTime =
// //         jobLength / (feed * rpm);

// //     return MachiningResult(
// //       speed: speed,
// //       feed: feed,
// //       rpm: rpm,
// //       doc: doc,
// //       machiningTime: machiningTime,
// //       mrr: mrr,
// //     );
// //   }
// // }

// import 'dart:math';

// import '../data/industrial_machining_database.dart';
// import '../models/machining_model.dart';

// class MachiningService {
//   static MachiningResult calculate({
//     required String material,
//     required String tool,
//     required double diameter,
//     required bool finishing,
//   }) {
//     //------------------------------------------------------------
//     // Select Operation
//     //------------------------------------------------------------

//     final operation = finishing ? "Finishing" : "Roughing";

//     //------------------------------------------------------------
//     // Read Database
//     //------------------------------------------------------------

//     final data = IndustrialMachiningDatabase
//         .database[material]![tool]![operation];

//     final double minSpeed =
//         data["speedMin"].toDouble();

//     final double maxSpeed =
//         data["speedMax"].toDouble();

//     final double minFeed =
//         data["feedMin"].toDouble();

//     final double maxFeed =
//         data["feedMax"].toDouble();

//     final double doc =
//         data["doc"].toDouble();

//     //------------------------------------------------------------
//     // Average Recommended Values
//     //------------------------------------------------------------

//     final double speed =
//         (minSpeed + maxSpeed) / 2;

//     final double feed =
//         (minFeed + maxFeed) / 2;

//     //------------------------------------------------------------
//     // RPM
//     // Formula:
//     // RPM=(1000×Vc)/(π×D)
//     //------------------------------------------------------------

//     final double rpm =
//         (1000 * speed) /
//             (pi * diameter);

//     //------------------------------------------------------------
//     // RPM Range
//     //------------------------------------------------------------

//     final double minRPM =
//         (1000 * minSpeed) /
//             (pi * diameter);

//     final double maxRPM =
//         (1000 * maxSpeed) /
//             (pi * diameter);

//     //------------------------------------------------------------
//     // Assume Job Length
//     //------------------------------------------------------------

//     const double jobLength = 100.0; // mm

//     //------------------------------------------------------------
//     // Feed Speed
//     //------------------------------------------------------------

//     final double feedSpeed =
//         feed * rpm;

//     //------------------------------------------------------------
//     // Machining Time
//     //------------------------------------------------------------

//     final double machiningTime =
//         jobLength / feedSpeed;

//     //------------------------------------------------------------
//     // Material Removal Rate
//     //------------------------------------------------------------

//     final double mrr =
//         speed * feed * doc;

//     //------------------------------------------------------------
//     // AI Recommendation
//     //------------------------------------------------------------

//     String recommendation =
//         "Recommended parameters are within industrial limits.";

//     bool safe = true;

//     if (diameter < 10) {
//       recommendation =
//           "Small diameter detected. Use light feed and shallow depth of cut.";
//     }

//     if (diameter > 150) {
//       recommendation =
//           "Large workpiece detected. Ensure rigid clamping.";
//     }

//     if (rpm > maxRPM) {
//       recommendation =
//           "Calculated RPM exceeds safe limit.";
//       safe = false;
//     }

//     if (rpm < minRPM) {
//       recommendation =
//           "Calculated RPM is below recommended range.";
//       safe = false;
//     }

//     //------------------------------------------------------------
//     // Return Result
//     //------------------------------------------------------------

//     return MachiningResult(
//       cuttingSpeed: speed,
//       feedRate: feed,
//       spindleRPM: rpm,
//       depthOfCut: doc,
//       machiningTime: machiningTime,
//       materialRemovalRate: mrr,
//       minSpeed: minSpeed,
//       maxSpeed: maxSpeed,
//       minFeed: minFeed,
//       maxFeed: maxFeed,
//       minRPM: minRPM,
//       maxRPM: maxRPM,
//       recommendation: recommendation,
//       safe: safe,
//     );
//   }
// <<<<<<< HEAD
// =======
// import 'dart:math';

// import '../data/machining_database.dart';
// import '../models/machining_model.dart';

// class MachiningService {

//   static MachiningResult calculate({

//     required String material,
//     required String tool,

//     required double diameter,

//     required bool finishing,

//   }) {

//     final data =
//         MachiningDatabase
//             .cuttingData[material]![tool]!;

//     double speed = data["speed"];

//     double feed = data["feed"];

//     double doc = data["doc"];

//     if(finishing){

//       feed *=0.6;

//       doc *=0.5;

//     }

//     final rpm =
//         (1000*speed)/(pi*diameter);

//     final machiningTime =
//         diameter/feed;

//     final mrr =
//         speed*feed*doc;

//     return MachiningResult(

//       speed: speed,

//       feed: feed,

//       rpm: rpm,

//       doc: doc,

//       machiningTime: machiningTime,

//       mrr: mrr,

//     );

//   }

// >>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce
// =======
// >>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
// // }
import 'dart:math';
import '../data/industrial_machining_database.dart';
import '../models/machining_model.dart';

class MachiningService {
  static MachiningResult calculate({
    required String material,
    required String tool,
    required double diameter,
    required bool finishing,
    required String operation,
  }) {
    final opType = finishing ? "Finishing" : "Roughing";

    // final materialData = IndustrialMachiningDatabase.database[material];
    // if (materialData == null) {
    //   throw Exception("Material not found: $material");
    // }

    // final toolData = materialData[tool];
    // if (toolData == null) {
    //   throw Exception("Tool not found for material: $tool");
    // }

    // final opData = toolData[opType];
    // if (opData == null) {
    //   throw Exception("Operation not found: $opType");
    // }
    

    // final double minSpeed = (opData["speedMin"] ?? 0).toDouble();
    // final double maxSpeed = (opData["speedMax"] ?? 0).toDouble();
    // final double minFeed = (opData["feedMin"] ?? 0).toDouble();
    // final double maxFeed = (opData["feedMax"] ?? 0).toDouble();
    // final double doc = (opData["doc"] ?? 0).toDouble();
    // ---------- Cutting Speed (Table 2.5.1) ----------

final speedData =
    IndustrialMachiningDatabase.cuttingSpeedTable[material]?[tool]?[opType];

if (speedData == null) {
  throw Exception("Cutting speed data not found");
}

final double minSpeed = speedData[0].toDouble();
final double maxSpeed = speedData[1].toDouble();

// ---------- Feed (Table 2.5.2) ----------

final feedData =
    IndustrialMachiningDatabase.feedTable[material]?[operation];

if (feedData == null) {
  throw Exception("Feed data not found");
}

final double minFeed = feedData[0].toDouble();
final double maxFeed = feedData[1].toDouble();

// ---------- Depth of Cut ----------

const double doc = 2.0;

    final speed = (minSpeed + maxSpeed) / 2;
    final feed = (minFeed + maxFeed) / 2;
if (diameter <= 0) {
  throw Exception("Invalid diameter");
}
    final rpm = (1000 * speed) / (pi * diameter);
    final minRPM = (1000 * minSpeed) / (pi * diameter);
    final maxRPM = (1000 * maxSpeed) / (pi * diameter);

    const jobLength = 100.0;
    final feedSpeed = feed * rpm;
    // final machiningTime = jobLength / feedSpeed;
    final double machiningTime = feedSpeed == 0
    ? 0.0
    : jobLength / feedSpeed.toDouble();
    final double mrr = speed * feed * doc;

    String recommendation = "All parameters normal";
    bool safe = true;

    if (rpm > maxRPM) {
      recommendation = "RPM too high → reduce speed";
      safe = false;
    } else if (rpm < minRPM) {
      recommendation = "RPM too low → increase speed";
      safe = false;
    }

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