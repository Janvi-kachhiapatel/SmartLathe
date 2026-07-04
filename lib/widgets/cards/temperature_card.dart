import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/screens/vibit1/vibit1_screen.dart';
import 'package:smart_lathe_frontend/screens/vibit2/vibit2_screen.dart';

class TemperatureCard extends StatelessWidget {
  final double headstockTemp;
  final double toolpostTemp;

final double headstockVibration;
final double toolpostVibration;

  const TemperatureCard({
  super.key,
  required this.headstockTemp,
  required this.toolpostTemp,
  required this.headstockVibration,
  required this.toolpostVibration,
});

  Widget tempRow(
  String label,
  String value,
  Color color,
) {
  return Row(
    children: [
      Icon(
        Icons.thermostat,
        color: color,
        size: 20,
      ),

      const SizedBox(width: 8),

      Expanded(
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      FittedBox(
        child: Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}
  Widget vibrationRow(
  String label,
  String value,
  Color color,
) {
  return Row(
    children: [
      Icon(
        Icons.graphic_eq,
        color: color,
        size: 20,
      ),

      const SizedBox(width: 8),

      Expanded(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      Text(
        value,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),
     child: SingleChildScrollView(
  child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TEMPERATURE SUMMARY",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height:8),

                  Row(
  children: [

    Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Vibit2Screen(),
        ),
      );
    },
    child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [

            const Text(
              "HEAD STOCK",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
        

            const SizedBox(height: 8),

            tempRow(
              "Temp",
              "${headstockTemp.toStringAsFixed(1)}°C",
              Colors.orange,
            ),

            const SizedBox(height: 6),

            vibrationRow(
              "Vib",
              headstockVibration.toStringAsFixed(2),
              Colors.orange,
            ),
          ],
        ),
      ),
    ),
    ),
    const SizedBox(width: 10),

   Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Vibit1Screen(),
        ),
      );
    },
    child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [

            const Text(
              "TOOL POST",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 8),

            tempRow(
              "Temp",
              "${toolpostTemp.toStringAsFixed(1)}°C",
              Colors.blue,
            ),

            const SizedBox(height: 6),

            vibrationRow(
              "Vib",
              toolpostVibration.toStringAsFixed(2),
              Colors.blue,
            ),
          ],
        ),
      ),
    ),
   ),
  ],
),
               ],
      ),
    ),
  );
}
}