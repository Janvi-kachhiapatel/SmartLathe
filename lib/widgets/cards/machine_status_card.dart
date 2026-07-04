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

  Widget buildStatusColumn(
    String title,
    String status,
    bool isOn,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isOn ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(width: 5),

            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isOn ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MACHINE STATUS",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: buildStatusColumn(
                  "MACHINE",
                  machineStatus,
                  machineStatus.toUpperCase() == "ON",
                ),
              ),

              Container(
                height: 45,
                width: 1,
                color: Colors.grey.shade300,
              ),

              Expanded(
                child: buildStatusColumn(
                  "CHUCK KEY",
                  chuckStatus == 1 ? "PLACED" : "LIFTED",
                  chuckStatus == 1,
                ),
              ),

              Container(
                height: 45,
                width: 1,
                color: Colors.grey.shade300,
              ),

              Expanded(
                child: buildStatusColumn(
                  "BUZZER",
                  redBuzzer == 1 ? "ON" : "OFF",
                  redBuzzer == 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}