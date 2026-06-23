import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class ChuckCard extends StatelessWidget {
  final int chuckOn;
  final int redBuzzer;

  const ChuckCard({
    super.key,
    required this.chuckOn,
    required this.redBuzzer,
  });

  Widget statusRow(
    String label,
    bool status,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 10),

          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          Text(
            status ? "ON" : "OFF",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "CHUCK",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          statusRow(
            "Chuck",
            chuckOn == 1,
            chuckOn == 1 ? Colors.red : Colors.green,
          ),

          statusRow(
            "Red Buzzer",
            redBuzzer == 1,
            redBuzzer == 1 ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}