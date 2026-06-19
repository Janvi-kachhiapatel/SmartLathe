import 'package:flutter/material.dart';
import '../../models/machining_model.dart';
import '../../core/units.dart';

class RecommendedParametersCard extends StatelessWidget {

  final MachiningResult result;

  const RecommendedParametersCard({
    super.key,
    required this.result,
  });

  Widget rowItem(
      String title,
      String value,
      IconData icon,
      Color color) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(

        children: [

          CircleAvatar(
            radius: 20,
            backgroundColor: color.withOpacity(.12),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Text(

              "Recommended Parameters",

              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),

            ),

            const SizedBox(height: 20),

            rowItem(
              "Cutting Speed",
              "${result.speed.toStringAsFixed(1)} ${Units.cuttingSpeed}",
              Icons.speed,
              Colors.blue,
            ),

            rowItem(
              "Feed",
              "${result.feed.toStringAsFixed(2)} ${Units.feed}",
              Icons.compare_arrows,
              Colors.green,
            ),

            rowItem(
              "Spindle RPM",
              "${result.rpm.toStringAsFixed(0)} ${Units.rpm}",
              Icons.rotate_right,
              Colors.deepPurple,
            ),

            rowItem(
              "Depth Of Cut",
              "${result.doc.toStringAsFixed(1)} ${Units.doc}",
              Icons.layers,
              Colors.orange,
            ),

            rowItem(
              "Material Removal Rate",
              "${result.mrr.toStringAsFixed(2)} ${Units.mrr}",
              Icons.analytics,
              Colors.red,
            ),

            rowItem(
              "Machining Time",
              "${result.machiningTime.toStringAsFixed(2)} ${Units.machiningTime}",
              Icons.schedule,
              Colors.teal,
            ),

          ],
        ),
      ),
    );
  }
}