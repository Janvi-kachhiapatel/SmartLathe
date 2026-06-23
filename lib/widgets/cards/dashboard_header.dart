import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "24 May 2025 | 10:30:45 AM",
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textGrey,
          ),
        ),
        const Spacer(),
        Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Machine Connected",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}