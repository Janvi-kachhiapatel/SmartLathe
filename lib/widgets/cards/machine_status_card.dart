// import 'package:flutter/material.dart';
// import 'package:smart_lathe_frontend/core/app_colors.dart';

// class MachineStatusCard extends StatelessWidget {
//   final String machineStatus;
//   final int chuckStatus;
//   final int redBuzzer;

//   const MachineStatusCard({
//     super.key,
//     required this.machineStatus,
//     required this.chuckStatus,
//    required this.redBuzzer,
//   });

//   Widget statusRow(
//     String label,
//     Color color, {
//     String? value,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: Row(
//         children: [
//           Container(
//             width: 11,
//             height: 11,
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.circle,
//             ),
//           ),

//           const SizedBox(width: 10),

//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w500,
//             ),
//           ),

//           const Spacer(),

//           if (value != null)
//             Text(
//               value,
//               style: TextStyle(
//                 color: color,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 13,
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "MACHINE STATUS",
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),

//           const SizedBox(height: 10),

//           statusRow(
//             machineStatus,
//             machineStatus == "ON"
//                 ? Colors.green
//                 : Colors.red,
//             value: machineStatus,
//           ),

//           const SizedBox(height: 10),

//           statusRow(
//             "CHUCK",
//             chuckStatus == 1
//                 ? Colors.red
//                 : Colors.green,
//             value: chuckStatus == 1
//                 ? "CLOSED"
//                 : "OPEN",
//           ),
//           const SizedBox(height: 8),

//       statusRow(
//         "BUZZER",
//         redBuzzer == 1
//             ? Colors.red
//             : Colors.grey,
//         value: redBuzzer == 1
//             ? "ON"
//             : "OFF",
//       ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class MachineStatusCard extends StatelessWidget {
  final String machineStatus;
  final int chuckStatus;
  final int redBuzzer;

  const MachineStatusCard({
    super.key,
    required this.machineStatus,
    required this.chuckStatus,
    required this.redBuzzer,
  });

  Widget statusTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String status,
    required bool isOn,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),

          const SizedBox(width: 8),

         Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),

      const SizedBox(height: 2),

      Text(
        status,
        style: TextStyle(
          color: isOn ? Colors.green : Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    ],
  ),
),

Container(
  width: 12,
  height: 12,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: isOn ? Colors.green : Colors.red,
    boxShadow: [
      BoxShadow(
        color: (isOn ? Colors.green : Colors.red)
            .withOpacity(0.9),
        blurRadius: 12,
        spreadRadius: 4,
      ),
    ],
  ),
),

          //       const SizedBox(height: 4),

          //       Text(
          //         status,
          //         style: TextStyle(
          //           color: isOn ? Colors.green : Colors.red,
          //           fontWeight: FontWeight.w600,
          //           fontSize: 13,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MACHINE STATUS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 14),

          statusTile(
            icon: Icons.power_settings_new,
            iconColor: Colors.deepPurple,
            title: "MACHINE",
            status: machineStatus,
            isOn: machineStatus.toUpperCase() == "ON",
          ),

          statusTile(
            icon: Icons.settings,
            iconColor: Colors.blue,
            title: "CHUCK KEY",
            status: chuckStatus == 1 ? "CLOSED" : "OPEN",
            isOn: chuckStatus == 1,
          ),

          statusTile(
            icon: Icons.volume_up,
            iconColor: Colors.orange,
            title: "BUZZER",
            status: redBuzzer == 1 ? "ON" : "OFF",
            isOn: redBuzzer == 1,
          ),
        ],
      ),
    );
  }
}