import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class StatusPanel extends StatelessWidget {
  const StatusPanel({super.key});

  Widget item(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: color,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 15),
          ),
          const Spacer(),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "MACHINE STATUS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            item("ON", "ON", Colors.green),
            item("FORWARD", "", Colors.green),
            item("REVERSE", "", Colors.grey),
            item("IDLE", "", Colors.grey),
            item("E-STOP", "", Colors.red),
            item("CHUCK", "CLOSED", Colors.green),
          ],
        ),
      ),
    );
  }
}