import 'package:flutter/material.dart';
import '../../services/machining_service.dart';
import '../../models/machining_model.dart';
//import '../../widgets/machining/comparison_card.dart';
import '../../services/api_service.dart';
import 'dart:async';
//import '../../services/comparison_service.dart';
import '../../widgets/machining/kpi_card.dart';
import '../../widgets/machining/recommended_parameters_card.dart';
import '../../widgets/machining/live_machine_card.dart';
import '../../services/ai_recommendation_service.dart';

class MachiningScreen extends StatefulWidget {
  const MachiningScreen({super.key});

  @override
  State<MachiningScreen> createState() => _MachiningScreenState();
}

class _MachiningScreenState extends State<MachiningScreen> {

  String? tool;
  String? material;
  String? operation;
  MachiningResult? result;
  Timer? timer;
  Map<String,dynamic> liveData = {};

  Future<void> loadLiveData() async {
  try {
    liveData = await ApiService.getData();

    if (!mounted) return;

    setState(() {});
  } catch (e) {
    debugPrint("Live Data Error: $e");
  }
}

  bool finishing = false;

  final diameterController = TextEditingController();
  @override
void initState() {
  super.initState();

  loadLiveData();

  timer = Timer.periodic(
    const Duration(seconds: 5),
    (_) {
      loadLiveData();
    },
  );
}

@override
void dispose() {
  timer?.cancel();
  diameterController.dispose();
  super.dispose();
}



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  title: const Text(
    "Smart Machining Assistant",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  ),
),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(
              elevation: 3,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: Padding(

                padding: const EdgeInsets.all(16),

                child: Column(

                  children: [

                    const Text(
                      "Job Setup",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 20),

                    DropdownButtonFormField<String>(

                      decoration: const InputDecoration(
                        labelText: "Tool Material",
                        border: OutlineInputBorder(),
                      ),

                      value: tool,

                      items: const [

                        DropdownMenuItem(
                            value: "HSS",
                            child: Text("HSS")),

                        DropdownMenuItem(
                            value: "Carbide",
                            child: Text("Carbide")),

                        // DropdownMenuItem(
                        //     value: "Ceramic",
                        //     child: Text("Ceramic")),

                      ],

                      onChanged: (v) {
                        setState(() {
                          tool = v;
                        });
                      },

                    ),

                    //const SizedBox(height: 20),

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

        //const SizedBox(height: 20),

        // Text(
        //   "RPM : ${((liveData["vibit1"]?["rpm"] ?? 0) as num).toStringAsFixed(0)}",
        // ),

        // const SizedBox(height: 10),

        // Text(
        //   "Temperature : ${(liveData["vibit1"]?["temperature"] ?? 0)} °C",
        // ),

        // const SizedBox(height: 10),

        // Text(
        //   "Vibration : ${(liveData["vibit1"]?["z_rms_velocity"] ?? 0)} mm/s",
        // ),

        // const SizedBox(height: 10),

        // Text(
        //   "Power : ${(liveData["energy"]?["data"]?["total_kW"] ?? 0)} kW",
        // ),

      

                    const SizedBox(height: 18),

                    DropdownButtonFormField<String>(

                      decoration: const InputDecoration(
                        labelText: "Workpiece Material",
                        border: OutlineInputBorder(),
                      ),
                      

                      value: material,

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
    value: "Copper Alloy",
    child: Text("Copper Alloy"),
),

DropdownMenuItem(
    value: "Aluminium Alloy",
    child: Text("Aluminium Alloy"),
),

                      ],

                      onChanged: (v) {
                        setState(() {
                          material = v;
                        });
                      },

                    ),

                    const SizedBox(height: 18),

                    DropdownButtonFormField<String>(

                      decoration: const InputDecoration(
                        labelText: "Operation",
                        border: OutlineInputBorder(),
                      ),

                      value: operation,

                      items: const [

                        DropdownMenuItem(
                            value: "Turning",
                            child: Text("Turning")),

                        DropdownMenuItem(
                            value: "Facing",
                            child: Text("Facing")),

                        DropdownMenuItem(
                            value: "Drilling",
                            child: Text("Drilling")),

                        DropdownMenuItem(
                            value: "Threading",
                            child: Text("Threading")),

                      ],

                      onChanged: (v) {
                        setState(() {
                          operation = v;
                        });
                      },

                    ),
//const SizedBox(height: 20),

// const Text(
//   "Comparison",
//   style: TextStyle(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//   ),
// ),

//const SizedBox(height: 10),

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
                    const SizedBox(height: 18),

                    TextField(

                      controller: diameterController,

                      keyboardType:
                          TextInputType.number,

                      decoration: const InputDecoration(

                        labelText: "Diameter (mm)",

                        border: OutlineInputBorder(),

                      ),

                    ),

                    const SizedBox(height: 20),

                    SwitchListTile(

                      value: finishing,

                      title: const Text("Finishing"),

                      onChanged: (v) {

                        setState(() {

                          finishing = v;

                        });

                      },

                    ),

                    const SizedBox(height: 25),
SizedBox(
  width: double.infinity,
  height: 58,
  child: ElevatedButton.icon(
    icon: const Icon(Icons.calculate),
    label: const Text(
      "Calculate ",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
   

                        onPressed: () {

  if (tool == null ||
    material == null ||
    operation == null ||
    diameterController.text.isEmpty) {

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Please fill all fields"),
    ),
  );

  return;
}

result = MachiningService.calculate(
  material: material!,
  tool: tool!,
  diameter: double.parse(diameterController.text),
  finishing: finishing,
);

setState(() {});

  // result =
  //     MachiningService.calculate(

  //   material: material!,

  //   tool: tool!,

  //   diameter:
  //       double.parse(
  //           diameterController.text),

  //   finishing: finishing,

  // );

  // setState(() {});

},

                        // child: const Text(
                        //   "CALCULATE",
                        //   style: TextStyle(
                        //       fontSize: 18),
                        // ),

                      ),

                    ),

                  ],

                ),

              ),

            ),

            const SizedBox(height: 25),

            Card(

              child: Padding(

                padding: const EdgeInsets.all(20),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children:  [

                    if (result != null)
  RecommendedParametersCard(
    result: result!,
  ),
  const SizedBox(height: 20),

LiveMachineCard(
  data: liveData,
),
      ],
    ),
  ),
),

                    

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
//              const SizedBox(height:25),

// Card(
//   elevation: 3,

//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(18),
//   ),

//   child: Padding(
//     padding: const EdgeInsets.all(20),

//     child: Column(

//       crossAxisAlignment:
//           CrossAxisAlignment.start,

//       children: [

//         const Text(
//           "Live Machine Data",

//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         const SizedBox(height:20),

//         Row(
//           children: [

//             Expanded(
//               child: KpiCard(
//   icon: Icons.speed,
//   title: "RPM",
//   value: ((liveData["vibit1"]?["rpm"] ?? 0).toDouble()).toStringAsFixed(0),
//   unit: "RPM",
//   color: Colors.blue,
// ),
//             ),

//             const SizedBox(width:15),

//             Expanded(
//               child: KpiCard(
//   icon: Icons.thermostat,
//   title: "Temperature",
//   value: "${liveData["vibit1"]?["temperature"] ?? 0}",
//   unit: "°C",
//   color: Colors.red,
// ),
//             ),

//           ],
//         ),

//         const SizedBox(height:15),

//         Row(
//           children: [

//             Expanded(
//               child: KpiCard(
//   icon: Icons.graphic_eq,
//   title: "Vibration",
//   value: "${liveData["vibit1"]?["z_rms_velocity"] ?? 0}",
//   unit: "mm/s",
//   color: Colors.green,
// ),
//             ),

//             const SizedBox(width:15),

//             Expanded(
//               child: KpiCard(
//   icon: Icons.bolt,
//   title: "Power",
//   value: "${liveData["energy"]?["data"]?["total_kW"] ?? 0}",
//   unit: "kW",
//   color: Colors.orange,
// ),
         // ),

          //],
       // ),

      //],
   // ),
  //),
//),
// Card(
//   elevation: 2,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(18),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.all(18),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "AI Recommendation",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         const SizedBox(height: 15),

//         if (result != null)
//           const Text(
//             "AI insights will appear here once enabled.",
//           )
//         else
//           const Text(
//             "Run calculation to get AI recommendations.",
//           )
//                 ],
//     ),
//   ),
// ),
          ],
        ),
      ),
    );
  }
}