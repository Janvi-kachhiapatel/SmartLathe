
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../../services/api_service.dart';

// class AlarmsScreen extends StatefulWidget {
//   const AlarmsScreen({super.key});

//   @override
//   State<AlarmsScreen> createState() => _AlarmsScreenState();
// }

// class _AlarmsScreenState extends State<AlarmsScreen> {

//   Timer? timer;
//   Map<String,dynamic> liveData = {};

//   @override
//   void initState() {
//     super.initState();

//     loadData();

//     timer = Timer.periodic(
//       const Duration(seconds: 5),
//       (_) => loadData(),
//     );
//   }

//   Future<void> loadData() async {

//     try{

//       liveData = await ApiService.getData();

//       if(mounted){
//         setState(() {});
//       }

//     }catch(e){

//       debugPrint(e.toString());

//     }

//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//     double rpm =
//         ((liveData["vibit1"]?["rpm"] ?? 0) as num).toDouble();

//     double temperature =
//         ((liveData["vibit1"]?["temperature"] ?? 0) as num).toDouble();

//     double vibration =
//         ((liveData["vibit1"]?["z_rms_velocity"] ?? 0) as num).toDouble();

//     double power =
//         ((liveData["energy"]?["data"]?["total_kW"] ?? 0) as num).toDouble();

//     List<Map<String,dynamic>> alarms=[];

//     if(rpm>1800){
//       alarms.add({
//         "title":"High RPM",
//         "value":"${rpm.toStringAsFixed(0)} RPM",
//         "color":Colors.red
//       });
//     }

//     if(temperature>50){
//       alarms.add({
//         "title":"High Temperature",
//         "value":"${temperature.toStringAsFixed(1)} °C",
//         "color":Colors.orange
//       });
//     }

//     if(vibration>2){
//       alarms.add({
//         "title":"High Vibration",
//         "value":"${vibration.toStringAsFixed(2)} mm/s",
//         "color":Colors.red
//       });
//     }

//     if(power>5){
//       alarms.add({
//         "title":"Power Consumption High",
//         "value":"${power.toStringAsFixed(2)} kW",
//         "color":Colors.deepOrange
//       });
//     }

//     return Scaffold(

//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Machine Alarms",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: Padding(

//         padding: const EdgeInsets.all(18),

//         child: Column(

//           children: [

//             Card(

//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18),
//               ),

//               child: ListTile(

//                 leading: CircleAvatar(
//                   backgroundColor: alarms.isEmpty
//                       ? Colors.green
//                       : Colors.red,
//                   child: Icon(
//                     alarms.isEmpty
//                         ? Icons.check
//                         : Icons.warning,
//                     color: Colors.white,
//                   ),
//                 ),

//                 title: Text(
//                   alarms.isEmpty
//                       ? "Machine Healthy"
//                       : "${alarms.length} Active Alarms",
//                 ),

//                 subtitle: Text(
//                   alarms.isEmpty
//                       ? "No abnormal condition detected."
//                       : "Immediate attention required.",
//                 ),

//               ),

//             ),

//             const SizedBox(height:20),

//             Expanded(

//               child: alarms.isEmpty

//                   ? const Center(

//                       child: Text(
//                         "No Active Alarm",
//                         style: TextStyle(
//                           fontSize:22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green,
//                         ),
//                       ),
//                     )

//                   : ListView.builder(

//                       itemCount: alarms.length,

//                       itemBuilder:(context,index){

//                         final alarm=alarms[index];

//                         return Card(

//                           margin:
//                               const EdgeInsets.only(bottom:15),

//                           color:
//                               alarm["color"].withOpacity(.08),

//                           shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.circular(18),
//                           ),

//                           child: ListTile(

//                             leading: Icon(
//                               Icons.warning_amber,
//                               color: alarm["color"],
//                               size:35,
//                             ),

//                             title: Text(
//                               alarm["title"],
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),

//                             subtitle: Text(alarm["value"]),

//                           ),

//                         );

//                       },

//                     ),

//             ),

//           ],
// <<<<<<< HEAD
// =======
// import 'package:flutter/material.dart';

// class AlarmsScreen extends StatelessWidget {

//   const AlarmsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(
//         title: const Text("Alarms"),
//       ),

//       body: const Center(

//         child: Text(

//           "Alarm module coming soon",

//           style: TextStyle(fontSize: 20),
// >>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce
// =======
// >>>>>>> 292fff0476037f438e8d105c003a0f2e0c69c191

//         ),

//       ),

//     );

//   }

// }
import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  Timer? timer;
  Map<String, dynamic> liveData = {};

  @override
  void initState() {
    super.initState();

    loadData();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => loadData(),
    );
  }

  Future<void> loadData() async {
    try {
      liveData = await ApiService.getData();

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final vibit1 = liveData["vibit1"] ?? {};
  final energy = liveData["energy"]?["data"] ?? {};
  final machine = liveData["machine"] ?? {};
  final chuck = liveData["chuck"] ?? {};

  double rpm = (vibit1["rpm"] ?? 0).toDouble();
  double temperature = (vibit1["temperature"] ?? 0).toDouble();
  double vibration = (vibit1["z_rms_velocity"] ?? 0).toDouble();

  double voltage = (energy["avg_voltage_LN"] ?? 0).toDouble();
  double current = (energy["avg_current"] ?? 0).toDouble();
  double power = (energy["total_kW"] ?? 0).toDouble();
  double frequency = (energy["frequency"] ?? 0).toDouble();

  bool machineOn = machine["status"] == "ON";
  bool chuckOn = chuck["chuck_on"] == 1;
  bool redBuzzer = chuck["red_buzzer"] == 1;

  List<Map<String, dynamic>> alarms = [];

  // Emergency
  if (redBuzzer) {
    alarms.add({
      "title": "Emergency Alarm",
      "value": "Red buzzer is ON",
      "color": Colors.red,
      "icon": Icons.emergency,
    });
  }

  // Temperature
  if (temperature > 60) {
    alarms.add({
      "title": "High Temperature",
      "value": "${temperature.toStringAsFixed(1)} °C",
      "color": Colors.deepOrange,
      "icon": Icons.thermostat,
    });
  }

  // Vibration
  if (vibration > 4) {
    alarms.add({
      "title": "High Vibration",
      "value": "${vibration.toStringAsFixed(2)} mm/s",
      "color": Colors.red,
      "icon": Icons.vibration,
    });
  }

  // Voltage
  if (voltage < 210 || voltage > 250) {
    alarms.add({
      "title": "Voltage Out of Range",
      "value": "${voltage.toStringAsFixed(1)} V",
      "color": Colors.orange,
      "icon": Icons.bolt,
    });
  }

  // Frequency
  if (frequency < 49.5 || frequency > 50.5) {
    alarms.add({
      "title": "Frequency Fault",
      "value": "${frequency.toStringAsFixed(2)} Hz",
      "color": Colors.orange,
      "icon": Icons.electrical_services,
    });
  }

  // High Current
  if (current > 10) {
    alarms.add({
      "title": "High Current",
      "value": "${current.toStringAsFixed(2)} A",
      "color": Colors.deepOrange,
      "icon": Icons.flash_on,
    });
  }

  // High Power
  if (power > 5) {
    alarms.add({
      "title": "High Power Consumption",
      "value": "${power.toStringAsFixed(2)} kW",
      "color": Colors.deepOrange,
      "icon": Icons.bolt,
    });
  }

  // RPM
  if (rpm > 1800) {
    alarms.add({
      "title": "High RPM",
      "value": "${rpm.toStringAsFixed(0)} RPM",
      "color": Colors.red,
      "icon": Icons.speed,
    });
  }

  // Machine running but spindle stopped
  if (machineOn && rpm == 0 && power > 0.2) {
    alarms.add({
      "title": "Spindle Not Rotating",
      "value": "Machine ON but RPM = 0",
      "color": Colors.orange,
      "icon": Icons.warning,
    });
  }

  // Chuck
  if (machineOn && !chuckOn) {
    alarms.add({
      "title": "Chuck Open",
      "value": "Chuck is OFF",
      "color": Colors.red,
      "icon": Icons.build_circle,
    });
  }

  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: const Text(
        "Machine Alarms",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    alarms.isEmpty ? Colors.green : Colors.red,
                child: Icon(
                  alarms.isEmpty
                      ? Icons.check
                      : Icons.warning,
                  color: Colors.white,
                ),
              ),
              title: Text(
                alarms.isEmpty
                    ? "Machine Healthy"
                    : "${alarms.length} Active Alarms",
              ),
              subtitle: Text(
                alarms.isEmpty
                    ? "No abnormal condition detected."
                    : "Immediate attention required.",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: alarms.isEmpty
                ? const Center(
                    child: Text(
                      "No Active Alarm",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: alarms.length,
                    itemBuilder: (context, index) {
                      final alarm = alarms[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        color: (alarm["color"] as Color)
                            .withOpacity(.08),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(18),
                        ),
                        child: ListTile(
                          leading: Icon(
                            alarm["icon"] as IconData,
                            color: alarm["color"] as Color,
                            size: 35,
                          ),
                          title: Text(
                            alarm["title"] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text(alarm["value"] as String),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    ),
  );
}
}