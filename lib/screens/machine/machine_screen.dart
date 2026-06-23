import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class MachineScreen extends StatelessWidget {
  const MachineScreen({super.key});

  Widget statusRow(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget cycleCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget whiteSection(Widget child) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Text("Machine Status"),
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [

            /// MACHINE CONTROL
            whiteSection(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "MACHINE CONTROL",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  statusRow("Machine", "ON", Colors.green),
                  statusRow("Spindle", "ON", Colors.green),
                  statusRow("Direction", "FORWARD", Colors.green),
                  statusRow("Mode", "AUTO", Colors.blue),
                  statusRow("Feed", "RUNNING", Colors.orange),
                  statusRow("Chuck", "CLOSED", Colors.green),
                  statusRow("E-Stop", "NORMAL", Colors.green),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// STATUS INDICATORS
            whiteSection(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "STATUS INDICATORS",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    children: [
                      indicatorCard("Lubrication", Icons.opacity, Colors.blue),
                      indicatorCard("Coolant", Icons.ac_unit, Colors.cyan),
                      indicatorCard("Air Pressure", Icons.air, Colors.green),
                      indicatorCard("Door", Icons.door_front_door, Colors.orange),
                      indicatorCard("Overload", Icons.warning, Colors.red),
                      indicatorCard("Normal", Icons.check_circle, Colors.green),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            /// CYCLE INFO
            Row(
              children: [
                cycleCard("Cycle Time", "00:12:45", Colors.blue),
                const SizedBox(width: 12),
                cycleCard("Part Count", "125", Colors.green),
                const SizedBox(width: 12),
                cycleCard("Reject Count", "2", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}