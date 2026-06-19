// import 'dart:math';

// import '../data/cutting_speed_table.dart';
// import '../data/feed_table.dart';
// import '../models/machining_model.dart';

// class MachiningService {

//   static MachiningResult calculate({

//   required String material,
//   required String tool,
//   required double diameter,
//   required bool finishing,

// }) {

//   final operation =
//       finishing ? "Finishing" : "Roughing";

//   //---------------------------------------------------
//   // Cutting Speed
//   //---------------------------------------------------
  
//   double speed =
//       CuttingSpeedTable.getCuttingSpeed(

//     material: material,

//     tool: tool,

//     operation: operation,

//   );

//   //---------------------------------------------------
//   // Feed
//   //---------------------------------------------------

//   double feed =
//       FeedTable.getFeed(

//     material: material,

//     operation: operation,

//   );

//   //---------------------------------------------------
//   // Depth Of Cut
//   //---------------------------------------------------

//   double doc =
//       finishing ? 0.5 : 2.0;

//   //---------------------------------------------------
//   // RPM
//   //---------------------------------------------------

//   double rpm =
//       (1000 * speed) /
//           (pi * diameter);

//   //---------------------------------------------------
//   // Material Removal Rate
//   //---------------------------------------------------

//   double mrr =
//       pi *
//       diameter *
//       feed *
//       doc *
//       rpm /
//       1000;

//   //---------------------------------------------------
//   // Estimated Machining Length
//   //---------------------------------------------------

//   const double jobLength = 100;

//   //---------------------------------------------------
//   // Machining Time
//   //---------------------------------------------------

//   double machiningTime =
//       jobLength /
//       (feed * rpm);

//   return MachiningResult(

//     speed: speed,

//     feed: feed,

//     rpm: rpm,

//     doc: doc,

//     machiningTime: machiningTime,

//     mrr: mrr,

//   );

// }

// }
import 'dart:math';

import '../data/cutting_speed_table.dart';
import '../data/feed_table.dart';
import '../models/machining_model.dart';

class MachiningService {

  static MachiningResult calculate({

    required String material,
    required String tool,
    required double diameter,
    required bool finishing,

  }) {

    final operation =
        finishing ? "Finishing" : "Roughing";

    double speed =
        CuttingSpeedTable.getCuttingSpeed(
      material: material,
      tool: tool,
      operation: operation,
    );

    double feed =
        FeedTable.getFeed(
      material: material,
      operation: operation,
    );

    double doc =
        finishing ? 0.5 : 2.0;

    double rpm =
        (1000 * speed) / (pi * diameter);

    double mrr =
        pi * diameter * feed * doc * rpm / 1000;

    const double jobLength = 100;

    double machiningTime =
        jobLength / (feed * rpm);

    return MachiningResult(
      speed: speed,
      feed: feed,
      rpm: rpm,
      doc: doc,
      machiningTime: machiningTime,
      mrr: mrr,
    );
  }
}