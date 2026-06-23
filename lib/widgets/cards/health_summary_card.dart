import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({super.key});

  Widget item(String title, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 16,
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
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          item("Machine Health", "90%", Colors.green),
          item("Severity", "GOOD", Colors.green),
          item("Predictive", "NO ISSUES", Colors.green),
        ],
      ),
    );
  }
}