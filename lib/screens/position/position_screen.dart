import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'dart:async';

class PositionScreen extends StatefulWidget {
  const PositionScreen({super.key});

  @override
  State<PositionScreen> createState() => _PositionScreenState();
  
}

class _PositionScreenState extends State<PositionScreen> {
  Map<String, dynamic> data = {};
  Timer? timer;
@override
void initState() {
  super.initState();

  loadData();

  timer = Timer.periodic(
    const Duration(seconds: 1),
    (_) => loadData(),
  );
}

@override
void dispose() {
  timer?.cancel();
  super.dispose();
}

Future<void> loadData() async {
  final result = await ApiService.getData();

  if (!mounted) return;

  setState(() {
  data = result;
  });
}

  Widget digitalPanel({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: " (mm)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 72,
                fontWeight: FontWeight.w300,
                letterSpacing: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

        Widget controlButton(
        String text,
        Color color,
        VoidCallback onPressed,
      ) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
         onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: const Text("X-Y Position Control"),
       
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            digitalPanel(
              title: "X POSITION",
              value: ((data["position"]?["x_position"] ?? 0) as num)
                .toDouble()
                .toStringAsFixed(3),
              color: Colors.orange,
            ),

            const SizedBox(height: 18),

            digitalPanel(
              title: "Y POSITION",
              value: ((data["position"]?["y_position"] ?? 0) as num)
              .toDouble()
              .toStringAsFixed(3),
              color: Colors.blue,
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CONTROLS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 14),

//             Row(
//               children: [
//                 controlButton(
//   //               "RESET ALL",
//   //               Colors.red,
//   //               () async {
//   // try {
//   //   await ApiService.resetAll();

//   //   await Future.delayed(
//   //     const Duration(milliseconds: 500),
// //     );

// //     await loadData();

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(
// //         content: Text("Reset Complete"),
// //       ),
// //     );
// //   } catch (e) {
// //     print(e);
// //   }
// // },
//               //),
//                 const SizedBox(width: 10),
//                  controlButton(
//                   "ZERO X",
//                   Colors.blue,
//                   () async {
//   try {
//     await ApiService.zeroX();

//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );

//     await loadData();

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("X Zeroed"),
//       ),
//     );
//   } catch (e) {
//     print(e);
//   }
// },
//                 ),
//               ],
//             ),

Row(
  children: [

    controlButton(
      "ZERO X",
      Colors.blue,
      () async {
        try {
          await ApiService.zeroX();

          await Future.delayed(
            const Duration(milliseconds: 500),
          );

          await loadData();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("X Zeroed"),
            ),
          );
        } catch (e) {
          print(e);
        }
      },
    ),

    const SizedBox(width: 10),

    controlButton(
      "ZERO Y",
      Colors.blue,
      () async {
        try {
          await ApiService.zeroY();

          await Future.delayed(
            const Duration(milliseconds: 500),
          );

          await loadData();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Y Zeroed"),
            ),
          );
        } catch (e) {
          print(e);
        }
      },
    ),

    const SizedBox(width: 10),

    controlButton(
      "ZERO BOTH",
      Colors.green,
      () async {
        try {
          await ApiService.zeroBoth();

          await Future.delayed(
            const Duration(milliseconds: 500),
          );

          await loadData();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Both Axes Zeroed"),
            ),
          );
        } catch (e) {
          print(e);
              }
      },
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 controlButton(
//                 "ZERO Y",
//                 Colors.blue,
//                 () async {
//   try {
//     await ApiService.zeroY();

//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );

//     await loadData();

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Y Zeroed"),
//       ),
//     );
//   } catch (e) {
//     print(e);
//   }
// },
//               ),
//                 const SizedBox(width: 10),
//                  controlButton(
//                   "ZERO BOTH",
//                   Colors.green,
//                   () async {
//   try {
//     await ApiService.zeroBoth();

//     await Future.delayed(
//       const Duration(milliseconds: 500),
//     );

//     await loadData();

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Both Axes Zeroed"),
//       ),
//     );
//   } catch (e) {
//     print(e);
//   }
// },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//  }
//  }