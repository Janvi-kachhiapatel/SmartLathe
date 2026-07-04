// // import 'package:flutter/material.dart';
// // import '../../services/machining_service.dart';
// // import '../../models/machining_model.dart';
// // <<<<<<< HEAD
// // <<<<<<< HEAD
// // =======
// // >>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
// // //import '../../widgets/machining/comparison_card.dart';
// // import '../../services/api_service.dart';
// // import 'dart:async';
// // //import '../../services/comparison_service.dart';
// // import '../../widgets/machining/kpi_card.dart';
// // import '../../widgets/machining/recommended_parameters_card.dart';
// // import '../../widgets/machining/live_machine_card.dart';
// // import '../../services/ai_recommendation_service.dart';
// // <<<<<<< HEAD
// // =======
// // import '../../widgets/machining/comparison_card.dart';
// // import '../../services/api_service.dart';
// // import 'dart:async';
// // import '../../services/comparison_service.dart';
// // import '../../widgets/machining/kpi_card.dart';
// // >>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce
// // =======
// // >>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191
// import 'package:flutter/material.dart';
// import 'dart:async';

// import '../../models/machining_model.dart';
// import '../../services/api_service.dart';
// import '../../services/ai_recommendation_service.dart';
// import '../../services/machining_service.dart';

// import '../../widgets/machining/kpi_card.dart';
// import '../../widgets/machining/live_machine_card.dart';
// import '../../widgets/machining/recommended_parameters_card.dart';


//  import '../../widgets/machining/comparison_card.dart';
//  import '../../services/comparison_service.dart';

// class MachiningScreen extends StatefulWidget {
//   const MachiningScreen({super.key});

//   @override
//   State<MachiningScreen> createState() => _MachiningScreenState();
// }

// class _MachiningScreenState extends State<MachiningScreen> {

//   String? tool;
//   String? material;
//   String? operation;
//   MachiningResult? result;
//   Timer? timer;
//   Map<String,dynamic> liveData = {};

//   Future<void> loadLiveData() async {
//   try {
//     liveData = await ApiService.getData();

//     if (!mounted) return;

//     setState(() {});
//   } catch (e) {
//     debugPrint("Live Data Error: $e");
//   }
// }

//   bool finishing = false;

//   final diameterController = TextEditingController();
//   @override
// void initState() {
//   super.initState();

//   loadLiveData();

//   timer = Timer.periodic(
//     const Duration(seconds: 5),
//     (_) {
//       loadLiveData();
//     },
//   );
// }

// @override
// void dispose() {
//   timer?.cancel();
//   diameterController.dispose();
//   super.dispose();
// }



//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(
//   elevation: 0,
//   centerTitle: true,
//   title: const Text(
//     "Smart Machining Assistant",
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 22,
//     ),
//   ),
// ),

//       body: SingleChildScrollView(

//         padding: const EdgeInsets.all(20),

//         child: Column(

//           children: [

//             Card(
//               elevation: 3,

//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),

//               child: Padding(

//                 padding: const EdgeInsets.all(16),

//                 child: Column(

//                   children: [

//                     const Text(
//                       "Job Setup",
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold),
//                     ),

//                     const SizedBox(height: 20),

//                     DropdownButtonFormField<String>(

//                       decoration: const InputDecoration(
//                         labelText: "Tool Material",
//                         border: OutlineInputBorder(),
//                       ),

//                       value: tool,

//                       items: const [

//                         DropdownMenuItem(
//                             value: "HSS",
//                             child: Text("HSS")),

//                         DropdownMenuItem(
//                             value: "Carbide",
//                             child: Text("Carbide")),

//                         // DropdownMenuItem(
//                         //     value: "Ceramic",
//                         //     child: Text("Ceramic")),

//                         DropdownMenuItem(
//                             value: "Ceramic",
//                             child: Text("Ceramic")),

//                         // DropdownMenuItem(
//                         //     value: "Ceramic",
//                         //     child: Text("Ceramic")),


//                       ],

//                       onChanged: (v) {
//                         setState(() {
//                           tool = v;
//                         });
//                       },

//                     ),


//                     //const SizedBox(height: 20),

// // Card(
// //   child: Padding(
// //     padding: const EdgeInsets.all(20),

// //     child: Column(

// //       crossAxisAlignment: CrossAxisAlignment.start,

// //       children: [

// //         const Text(
// //           "Live Machine Data",
// //           style: TextStyle(
// //             fontSize: 22,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),

//         //const SizedBox(height: 20),

//         // Text(
//         //   "RPM : ${((liveData["vibit1"]?["rpm"] ?? 0) as num).toStringAsFixed(0)}",
//         // ),

//         // const SizedBox(height: 10),

//         // Text(
//         //   "Temperature : ${(liveData["vibit1"]?["temperature"] ?? 0)} °C",
//         // ),

//         // const SizedBox(height: 10),

//         // Text(
//         //   "Vibration : ${(liveData["vibit1"]?["z_rms_velocity"] ?? 0)} mm/s",
//         // ),

//         // const SizedBox(height: 10),

//         // Text(
//         //   "Power : ${(liveData["energy"]?["data"]?["total_kW"] ?? 0)} kW",
//         // ),

      

//                     const SizedBox(height: 20),

// Card(
//   child: Padding(
//     padding: const EdgeInsets.all(20),

//     child: Column(

//       crossAxisAlignment: CrossAxisAlignment.start,

//       children: [

//         const Text(
//           "Live Machine Data",
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         const SizedBox(height: 20),

//         Text(
//           "RPM : ${(liveData["vibit1"]?["rpm"] ?? 0).toStringAsFixed(0)}",
//         ),

//         const SizedBox(height: 10),

//         Text(
//           "Temperature : ${(liveData["vibit1"]?["temperature"] ?? 0)} °C",
//         ),

//         const SizedBox(height: 10),

//         Text(
//           "Vibration : ${(liveData["vibit1"]?["z_rms_velocity"] ?? 0)} mm/s",
//         ),

//         const SizedBox(height: 10),

//         Text(
//           "Power : ${(liveData["energy"]?["data"]?["total_kW"] ?? 0)} kW",
//         ),

//       ],
//     ),
//   ),
// ),


//                     const SizedBox(height: 18),

//                     DropdownButtonFormField<String>(

//                       decoration: const InputDecoration(
//                         labelText: "Workpiece Material",
//                         border: OutlineInputBorder(),
//                       ),


//                       value: material,

//                       items: const [

//                         DropdownMenuItem(

//     value: "Gray Cast Iron",
//     child: Text("Gray Cast Iron"),
// ),

// DropdownMenuItem(
//     value: "Mild Steel",
//     child: Text("Mild Steel"),
// ),

// DropdownMenuItem(
//     value: "Copper Alloy",
//     child: Text("Copper Alloy"),
// ),

// DropdownMenuItem(
//     value: "Aluminium Alloy",
//     child: Text("Aluminium Alloy"),
// ),

//                             value: "Mild Steel",
//                             child: Text("Mild Steel")),

//                         DropdownMenuItem(
//                             value: "Aluminium",
//                             child: Text("Aluminium")),

//                         DropdownMenuItem(
//                             value: "Copper",
//                             child: Text("Copper")),

//                         DropdownMenuItem(
//                             value: "Cast Iron",
//                             child: Text("Cast Iron")),

//                         DropdownMenuItem(
//                             value: "SS304",
//                             child: Text("SS304")),


//                       ],

//                       onChanged: (v) {
//                         setState(() {
//                           material = v;
//                         });
//                       },

//                     ),

//                     const SizedBox(height: 18),

//                     DropdownButtonFormField<String>(

//                       decoration: const InputDecoration(
//                         labelText: "Operation",
//                         border: OutlineInputBorder(),
//                       ),

//                       value: operation,

//                       items: const [

//                         DropdownMenuItem(
//                             value: "Turning",
//                             child: Text("Turning")),

//                         DropdownMenuItem(
//                             value: "Facing",
//                             child: Text("Facing")),

//                         DropdownMenuItem(
//                             value: "Drilling",
//                             child: Text("Drilling")),

//                         DropdownMenuItem(
//                             value: "Threading",
//                             child: Text("Threading")),

//                       ],

//                       onChanged: (v) {
//                         setState(() {
//                           operation = v;
//                         });
//                       },

//                     ),

// //const SizedBox(height: 20),

// // const Text(
// //   "Comparison",
// //   style: TextStyle(
// //     fontSize: 22,
// //     fontWeight: FontWeight.bold,
// //   ),
// // ),

// //const SizedBox(height: 10),

// // ComparisonCard(

// //   title: "RPM",

// //   recommended:
// //       result == null
// //           ? "--"
// //           : result!.rpm.toStringAsFixed(0),

// //   actual:
// //       ((liveData["vibit1"]?["rpm"] ?? 0) as num)
// //           .toString(),

// //   color: Colors.green,

// // ),

// const SizedBox(height: 20),

// const Text(
//   "Comparison",
//   style: TextStyle(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//   ),
// ),

// const SizedBox(height: 10),

// ComparisonCard(

//   title: "RPM",

//   recommended:
//       result == null
//           ? "--"
//           : result!.rpm.toStringAsFixed(0),

//   actual:
//       ((liveData["vibit1"]?["rpm"] ?? 0) as num)
//           .toString(),

//   color: Colors.green,

// ),

//                     const SizedBox(height: 18),

//                     TextField(

//                       controller: diameterController,

//                       keyboardType:
//                           TextInputType.number,

//                       decoration: const InputDecoration(

//                         labelText: "Diameter (mm)",

//                         border: OutlineInputBorder(),

//                       ),

//                     ),

//                     const SizedBox(height: 20),

//                     SwitchListTile(

//                       value: finishing,

//                       title: const Text("Finishing"),

//                       onChanged: (v) {

//                         setState(() {

//                           finishing = v;

//                         });

//                       },

//                     ),

//                     const SizedBox(height: 25),

// SizedBox(
//   width: double.infinity,
//   height: 58,
//   child: ElevatedButton.icon(
//     icon: const Icon(Icons.calculate),
//     label: const Text(
//       "Calculate ",
//       style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
   

//                         onPressed: () {

//   if (tool == null ||
//     material == null ||
//     operation == null ||
//     diameterController.text.isEmpty) {

//   ScaffoldMessenger.of(context).showSnackBar(
//     const SnackBar(
//       content: Text("Please fill all fields"),
//     ),
//   );

//   return;
// }

// result = MachiningService.calculate(
//   material: material!,
//   tool: tool!,
//   diameter: double.parse(diameterController.text),
//   finishing: finishing,
// );

// setState(() {});

//   // result =
//   //     MachiningService.calculate(

//   //   material: material!,

//   //   tool: tool!,

//   //   diameter:
//   //       double.parse(
//   //           diameterController.text),

//   //   finishing: finishing,

//   // );

//   // setState(() {});

// },

//                         // child: const Text(
//                         //   "CALCULATE",
//                         //   style: TextStyle(
//                         //       fontSize: 18),
//                         // ),

//                       ),

//                     ),


//                     SizedBox(

//                       width: double.infinity,

//                       height: 55,

//                       child: ElevatedButton(

//                         onPressed: () {

//   if(tool==null || material==null) return;

//   result =
//       MachiningService.calculate(

//     material: material!,

//     tool: tool!,

//     diameter:
//         double.parse(
//             diameterController.text),

//     finishing: finishing,

//   );

//   setState(() {});

// },

//                         child: const Text(
//                           "CALCULATE",
//                           style: TextStyle(
//                               fontSize: 18),
//                         ),

//                       ),

//                     )


//                   ],

//                 ),

//               ),

//             ),

//             const SizedBox(height: 25),

//             Card(

//               child: Padding(

//                 padding: const EdgeInsets.all(20),

//                 child: Column(

//                   crossAxisAlignment:
//                       CrossAxisAlignment.start,

//                   children:  [


//                     if (result != null)
//   RecommendedParametersCard(
//     result: result!,
//   ),
//   const SizedBox(height: 20),

// LiveMachineCard(
//   data: liveData,
// ),
//       ],
//     ),
//   ),
// ),

                    

// //                     SizedBox(height: 20),

// //                     Text(
// // "Cutting Speed : ${result?.speed.toStringAsFixed(1) ?? '--'} m/min"),

// //                     SizedBox(height: 10),

// //                     Text(
// // "Feed : ${result?.feed.toStringAsFixed(2) ?? '--'} mm/rev"),

// //                     SizedBox(height: 10),

// //                     Text(
// // "RPM : ${result?.rpm.toStringAsFixed(0) ?? '--'}"),

// //                     SizedBox(height: 10),

// //                     Text(
// // "DOC : ${result?.doc.toStringAsFixed(1) ?? '--'} mm"),

// //                     SizedBox(height: 10),

// //                     Text(
// // "MRR : ${result?.mrr.toStringAsFixed(2) ?? '--'}"),
// // SizedBox(height: 10),

// // Text(
// // "Machining Time : ${result?.machiningTime.toStringAsFixed(2) ?? '--'} min"),

// //                   ],

// //                 ),

// //               ),
             

// //             ),
// //              const SizedBox(height:25),

// // Card(
// //   elevation: 3,

// //   shape: RoundedRectangleBorder(
// //     borderRadius: BorderRadius.circular(18),
// //   ),

// //   child: Padding(
// //     padding: const EdgeInsets.all(20),

// //     child: Column(

// //       crossAxisAlignment:
// //           CrossAxisAlignment.start,

// //       children: [

// //         const Text(
// //           "Live Machine Data",

// //           style: TextStyle(
// //             fontSize: 22,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),

// //         const SizedBox(height:20),

// //         Row(
// //           children: [

// //             Expanded(
// //               child: KpiCard(
// //   icon: Icons.speed,
// //   title: "RPM",
// //   value: ((liveData["vibit1"]?["rpm"] ?? 0).toDouble()).toStringAsFixed(0),
// //   unit: "RPM",
// //   color: Colors.blue,
// // ),
// //             ),

// //             const SizedBox(width:15),

// //             Expanded(
// //               child: KpiCard(
// //   icon: Icons.thermostat,
// //   title: "Temperature",
// //   value: "${liveData["vibit1"]?["temperature"] ?? 0}",
// //   unit: "°C",
// //   color: Colors.red,
// // ),
// //             ),

// //           ],
// //         ),

// //         const SizedBox(height:15),

// //         Row(
// //           children: [

// //             Expanded(
// //               child: KpiCard(
// //   icon: Icons.graphic_eq,
// //   title: "Vibration",
// //   value: "${liveData["vibit1"]?["z_rms_velocity"] ?? 0}",
// //   unit: "mm/s",
// //   color: Colors.green,
// // ),
// //             ),

// //             const SizedBox(width:15),

// //             Expanded(
// //               child: KpiCard(
// //   icon: Icons.bolt,
// //   title: "Power",
// //   value: "${liveData["energy"]?["data"]?["total_kW"] ?? 0}",
// //   unit: "kW",
// //   color: Colors.orange,
// // ),
//          // ),

//           //],
//        // ),

//       //],
//    // ),
//   //),
// //),
// // Card(
// //   elevation: 2,
// //   shape: RoundedRectangleBorder(
// //     borderRadius: BorderRadius.circular(18),
// //   ),
// //   child: Padding(
// //     padding: const EdgeInsets.all(18),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const Text(
// //           "AI Recommendation",
// //           style: TextStyle(
// //             fontSize: 20,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),

// //         const SizedBox(height: 15),

// //         if (result != null)
// //           const Text(
// //             "AI insights will appear here once enabled.",
// //           )
// //         else
// //           const Text(
// //             "Run calculation to get AI recommendations.",
// //           )
// //                 ],
// //     ),
// //   ),
// // ),
//           ],
//         ),
//       ),
//     );

//                     Text(
//                       "Recommended Parameters",
//                       style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold),
//                     ),

//                     SizedBox(height: 20),

//                     Text(
// "Cutting Speed : ${result?.speed.toStringAsFixed(1) ?? '--'} m/min"),

//                     SizedBox(height: 10),

//                     Text(
// "Feed : ${result?.feed.toStringAsFixed(2) ?? '--'} mm/rev"),

//                     SizedBox(height: 10),

//                     Text(
// "RPM : ${result?.rpm.toStringAsFixed(0) ?? '--'}"),

//                     SizedBox(height: 10),

//                     Text(
// "DOC : ${result?.doc.toStringAsFixed(1) ?? '--'} mm"),

//                     SizedBox(height: 10),

//                     Text(
// "MRR : ${result?.mrr.toStringAsFixed(2) ?? '--'}"),
// SizedBox(height: 10),

// Text(
// "Machining Time : ${result?.machiningTime.toStringAsFixed(2) ?? '--'} min"),

//                   ],

//                 ),

//               ),

//             ),

//           ],

//         ),

//       ),

//     );


//   }
// }
import 'package:provider/provider.dart';
import '../../providers/machining_provider.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../models/machining_model.dart';
import '../../services/api_service.dart';
import '../../services/machining_service.dart';

import '../../widgets/machining/kpi_card.dart';
import '../../widgets/machining/live_machine_card.dart';
import '../../widgets/machining/recommended_parameters_card.dart';
import '../../widgets/machining/comparison_card.dart';

class MachiningScreen extends StatefulWidget {
  const MachiningScreen({super.key});

  @override
  State<MachiningScreen> createState() => _MachiningScreenState();
}

class _MachiningScreenState extends State<MachiningScreen> {
  String? tool;
  String? material;
  String? operation;
  //MachiningResult? result;

  Timer? timer;
  Map<String, dynamic> liveData = {};

  bool finishing = false;
  bool _alarmVisible = false;
  String _lastAlarm = "";

  final diameterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadLiveData();
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => loadLiveData(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    diameterController.dispose();
    super.dispose();
  }

  Future<void> loadLiveData() async {
    try {
      final data = await ApiService.getData();
      if (!mounted) return;

      setState(() {
        liveData = data;
      });

      checkRecommendedParameters(); // ✅ run auto-check on live update
    } catch (e) {
      debugPrint("Live Data Error: $e");
    }
  }

  // ===================== LOGIC FUNCTIONS (MUST BE HERE) =====================

  double percentageDifference(double actual, double recommended) {
    if (recommended == 0) return 0;
    return ((actual - recommended).abs() / recommended) * 100;
  }

  void checkRecommendedParameters() {
    final result = context.read<MachiningProvider>().result;
if (result == null) return;

    final vibit1 = liveData["vibit1"] ?? {};

    final double liveRPM = (vibit1["rpm"] ?? 0).toDouble();
    final double liveTemperature = (vibit1["temperature"] ?? 0).toDouble();
    final double liveVibration = (vibit1["z_rms_velocity"] ?? 0).toDouble();

    String? message;

    if (percentageDifference(liveRPM, result!.spindleRPM) > 10) {
      message =
          "RPM mismatch\nRecommended: ${result!.spindleRPM.toStringAsFixed(0)}\nActual: ${liveRPM.toStringAsFixed(0)}";
    } 
    else if (liveTemperature > 60) {
      message =
          "High Temperature!\nCurrent: ${liveTemperature.toStringAsFixed(1)} °C";
    } 
    else if (liveVibration > 4) {
      message =
          "High Vibration!\nCurrent: ${liveVibration.toStringAsFixed(2)} mm/s";
    }

    if (message != null && !_alarmVisible && message != _lastAlarm) {
      _lastAlarm = message;
      showAlarm(message);
    }

    if (message == null) {
      _lastAlarm = "";
    }
  }

  void showAlarm(String message) {
    _alarmVisible = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 10),
            Text("Machining Alarm"),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _alarmVisible = false;
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // ===================== UI =====================
  Widget comparisonRow({
  required String label,
  required String recommended,
  required String live,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey.shade100,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        // Recommended
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              recommended,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Live
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              live,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


Widget compareRow(String label, String rec, String live) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        Expanded(
          child: Text(
            rec,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            live,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MachiningProvider>();
    final rawRpm = liveData["vibit1"]?["rpm"];
    final liveRpm = rawRpm is num ? rawRpm.toStringAsFixed(0) : "0";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Machining Assistant"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
  children: [
    const SizedBox(height: 10),

    Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Job Setup",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // TOOL
            DropdownButtonFormField<String>(
  value: tool,
  decoration: const InputDecoration(
    labelText: "Tool Material",
    border: OutlineInputBorder(),
  ),
  items: const [
    DropdownMenuItem(
      value: "HSS",
      child: Text("HSS"),
    ),
    DropdownMenuItem(
      value: "Carbide",
      child: Text("Carbide"),
    ),
  ],
  onChanged: (v) {
    setState(() => tool = v);
    context.read<MachiningProvider>().setTool(v!);
  },
),

            const SizedBox(height: 12),

            // MATERIAL
           DropdownButtonFormField<String>(
  value: material,
  decoration: const InputDecoration(
    labelText: "Work Material",
    border: OutlineInputBorder(),
  ),
  items: const [

    DropdownMenuItem(
      value: "Gray Cast Iron",
      child: Text("Gray Cast Iron"),
    ),

    DropdownMenuItem(
      value: "Mild Steel",
      child: Text("Mild Steel"),
    ),

    DropdownMenuItem(
      value: "Copper Alloys",
      child: Text("Copper Alloys"),
    ),

    DropdownMenuItem(
      value: "Aluminium Alloy",
      child: Text("Aluminium Alloy"),
    ),
  ],
  onChanged: (v) {
    setState(() => material = v);
    context.read<MachiningProvider>().setMaterial(v!);
  },
),
            const SizedBox(height: 12),
DropdownButtonFormField<String>(
  value: operation,
  decoration: const InputDecoration(
    labelText: "Operation",
    border: OutlineInputBorder(),
  ),
  items: const [

    DropdownMenuItem(
      value: "Turning",
      child: Text("Turning"),
    ),

    DropdownMenuItem(
      value: "Drilling",
      child: Text("Drilling"),
    ),

    DropdownMenuItem(
      value: "Thread Cutting",
      child: Text("Thread Cutting"),
    ),

    DropdownMenuItem(
      value: "Reaming",
      child: Text("Reaming"),
    ),

  ],
  onChanged: (v) {
    setState(() => operation = v);
    context.read<MachiningProvider>().setOperation(v!);
  },
),
const SizedBox(height: 12),
DropdownButtonFormField<String>(
  value: finishing ? "Finishing" : "Roughing",
  decoration: const InputDecoration(
    labelText: "Machining Type",
    border: OutlineInputBorder(),
  ),
  items: const [

    DropdownMenuItem(
      value: "Roughing",
      child: Text("Roughing"),
    ),

    DropdownMenuItem(
      value: "Finishing",
      child: Text("Finishing"),
    ),
  ],
  onChanged: (v) {
    setState(() {
      finishing = v == "Finishing";
    });
  },
),

            const SizedBox(height: 12),

            // DIAMETER
            TextField(
              controller: diameterController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Diameter",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // BUTTON
            ElevatedButton(
              onPressed: () {
  context.read<MachiningProvider>().setDiameter(
    double.parse(diameterController.text),
  );

                // setState(() {
                 context.read<MachiningProvider>().calculate();
  // material: material!,
  // tool: tool!,
  // diameter: double.parse(diameterController.text),
  // finishing: finishing,
  // operation: operation ?? "Turning",
//);
               // });
              },
              child: const Text("Calculate"),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(height: 20),

if (context.watch<MachiningProvider>().result != null)
  Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Parameter Comparison",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Row(
              children: [
                Expanded(flex: 3, child: Text("Parameter", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 2, child: Text("Recommended", textAlign: TextAlign.center)),
                SizedBox(width: 8),
                Expanded(flex: 2, child: Text("Live", textAlign: TextAlign.center)),
              ],
            ),
          ),

          const Divider(),

          comparisonRow(
            label: "RPM",
            recommended: context.watch<MachiningProvider>().result!.spindleRPM.toStringAsFixed(0),
            live: liveData["vibit1"]?["rpm"]?.toString() ?? "0",
          ),

          comparisonRow(
            label: "Temperature",
            recommended: context.watch<MachiningProvider>().result!.cuttingSpeed.toStringAsFixed(0),
            live: "${liveData["vibit1"]?["temperature"] ?? 0}",
          ),

          comparisonRow(
            label: "Vibration",
            recommended: "-",
            live: "${liveData["vibit1"]?["z_rms_velocity"] ?? 0}",
          ),

          comparisonRow(
  label: "Feed",
  recommended: context.watch<MachiningProvider>().result!.feedRate.toStringAsFixed(2),
  live: "${liveData["position"]?["feed_rate"] ?? 0}",
),

comparisonRow(
  label: "MRR",
  recommended: context.watch<MachiningProvider>().result!.materialRemovalRate.toStringAsFixed(2),
  live: "${liveData["position"]?["mrr"] ?? 0}",
),
        ],
      ),
    ),
  ),
        ],
  ),
),
);
  }
}