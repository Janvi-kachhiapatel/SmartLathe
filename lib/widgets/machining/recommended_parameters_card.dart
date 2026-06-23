// import 'package:flutter/material.dart';
// import '../../models/machining_model.dart';
// import '../../core/units.dart';

// class RecommendedParametersCard extends StatelessWidget {

//   final MachiningResult result;

//   const RecommendedParametersCard({
//     super.key,
//     required this.result,
//   });

//   Widget rowItem(
//       String title,
//       String value,
//       IconData icon,
//       Color color) {

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),

//       child: Row(

//         children: [

//           CircleAvatar(
//             radius: 20,
//             backgroundColor: color.withOpacity(.12),
//             child: Icon(
//               icon,
//               color: color,
//             ),
//           ),

//           const SizedBox(width: 14),

//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),

//           Text(
//             value,
//             style: TextStyle(
//               color: color,
//               fontWeight: FontWeight.bold,
//               fontSize: 17,
//             ),
//           ),

//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Card(

//       elevation: 2,

//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(18),
//       ),

//       child: Padding(

//         padding: const EdgeInsets.all(20),

//         child: Column(

//           crossAxisAlignment:
//               CrossAxisAlignment.start,

//           children: [

//             const Text(

//               "Recommended Parameters",

//               style: TextStyle(
//                 fontSize: 21,
//                 fontWeight: FontWeight.bold,
//               ),

//             ),

//             const SizedBox(height: 20),

//             rowItem(
//               "Cutting Speed",
//               "${result.speed.toStringAsFixed(1)} ${Units.cuttingSpeed}",
//               Icons.speed,
//               Colors.blue,
//             ),

//             rowItem(
//               "Feed",
//               "${result.feed.toStringAsFixed(2)} ${Units.feed}",
//               Icons.compare_arrows,
//               Colors.green,
//             ),

//             rowItem(
//               "Spindle RPM",
//               "${result.rpm.toStringAsFixed(0)} ${Units.rpm}",
//               Icons.rotate_right,
//               Colors.deepPurple,
//             ),

//             rowItem(
//               "Depth Of Cut",
//               "${result.doc.toStringAsFixed(1)} ${Units.doc}",
//               Icons.layers,
//               Colors.orange,
//             ),

//             rowItem(
//               "Material Removal Rate",
//               "${result.mrr.toStringAsFixed(2)} ${Units.mrr}",
//               Icons.analytics,
//               Colors.red,
//             ),

//             rowItem(
//               "Machining Time",
//               "${result.machiningTime.toStringAsFixed(2)} ${Units.machiningTime}",
//               Icons.schedule,
//               Colors.teal,
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../models/machining_model.dart';

class RecommendedParametersCard extends StatelessWidget {
  final MachiningResult result;

  const RecommendedParametersCard({
    super.key,
    required this.result,
  });

  Widget parameterTile(
    IconData icon,
    Color color,
    String title,
    String value,
    String unit,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.12),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  "$value $unit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget limitTile(
      String title,
      double min,
      double max,
      String unit) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 5),

      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Text(
            "${min.toStringAsFixed(1)} - ${max.toStringAsFixed(1)} $unit",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Row(
              children: [

                const Icon(
                  Icons.auto_awesome,
                  color: Colors.blue,
                ),

                const SizedBox(width: 10),

                const Text(
                  "Recommended",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            parameterTile(
              Icons.speed,
              Colors.blue,
              "Cutting Speed",
              result.cuttingSpeed.toStringAsFixed(1),
              "m/min",
            ),

            const SizedBox(height: 12),

            parameterTile(
              Icons.rotate_right,
              Colors.green,
              "Spindle Speed",
              result.spindleRPM.toStringAsFixed(0),
              "RPM",
            ),

            const SizedBox(height: 12),

            parameterTile(
              Icons.linear_scale,
              Colors.orange,
              "Feed Rate",
              result.feedRate.toStringAsFixed(2),
              "mm/rev",
            ),

            const SizedBox(height: 12),

            parameterTile(
              Icons.height,
              Colors.deepPurple,
              "Depth Of Cut",
              result.depthOfCut.toStringAsFixed(2),
              "mm",
            ),

            const SizedBox(height: 12),

            parameterTile(
              Icons.timer,
              Colors.red,
              "Machining Time",
              result.machiningTime.toStringAsFixed(2),
              "sec",
            ),

            const SizedBox(height: 12),

            parameterTile(
              Icons.inventory_2,
              Colors.teal,
              "MRR",
              result.materialRemovalRate
                  .toStringAsFixed(2),
              "cm³/min",
            ),

            const SizedBox(height: 25),

            const Divider(),

            const SizedBox(height: 10),

            const Text(
              "Recommended Limits",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            limitTile(
              "Cutting Speed",
              result.minSpeed,
              result.maxSpeed,
              "m/min",
            ),

            limitTile(
              "Feed Rate",
              result.minFeed,
              result.maxFeed,
              "mm/rev",
            ),

            limitTile(
              "RPM",
              result.minRPM,
              result.maxRPM,
              "RPM",
            ),

            const SizedBox(height: 20),

            Container(
              padding:
                  const EdgeInsets.all(15),

              decoration: BoxDecoration(

                color: result.safe
                    ? Colors.green.shade50
                    : Colors.red.shade50,

                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: Row(

                children: [

                  Icon(
                    result.safe
                        ? Icons.check_circle
                        : Icons.warning,
                    color: result.safe
                        ? Colors.green
                        : Colors.red,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      result.recommendation,
                      style: TextStyle(
                        color: result.safe
                            ? Colors.green
                            : Colors.red,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}