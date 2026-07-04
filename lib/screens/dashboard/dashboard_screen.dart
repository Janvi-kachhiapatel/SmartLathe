import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/widgets/cards/machine_status_card.dart';
import 'package:smart_lathe_frontend/widgets/gauges/exact_rpm_gauge.dart';
import 'package:smart_lathe_frontend/screens/alarms/alarms_screen.dart';
import 'package:smart_lathe_frontend/widgets/gauges/position_gauge.dart';
import 'package:smart_lathe_frontend/widgets/cards/temperature_card.dart';
import 'package:smart_lathe_frontend/widgets/gauges/exact_vibration_gauge.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'dart:async';
import 'package:smart_lathe_frontend/screens/profile/profile_screen.dart';
import 'package:smart_lathe_frontend/widgets/cards/chuck_card.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic> data = {};

bool backendConnected = false;

DateTime? lastMachineOnTime;
bool previousMachineStatusOn = false;

DateTime? lastUpdate;
  Map<String, dynamic> droData = {};

  bool loading = true;

  String currentTime = "";

  Timer? timer;
@override
void dispose() {
  timer?.cancel();
  super.dispose();
}
@override
void initState() {
  super.initState();

  loadData();

  updateTime();

  timer = Timer.periodic(
  const Duration(seconds: 5),
  (_) async {
    if (!mounted) return;

    updateTime();

    await loadData();

    setState(() {});
  },
);
}
void updateTime() {
  final now = DateTime.now();

  final hour =
      now.hour % 12 == 0 ? 12 : now.hour % 12;

  final minute =
      now.minute.toString().padLeft(2, '0');

  final ampm =
      now.hour >= 12 ? 'PM' : 'AM';

  currentTime =
      "${now.day}/${now.month}/${now.year} | $hour:$minute $ampm";
}
Future<void> loadData() async {
  try {
    print("LOAD DATA STARTED");

   final result = await ApiService.getData();

// 👇 ADD THIS BLOCK RIGHT HERE
final machineStatus =
    (result["machine"]?["status"] ?? "OFF").toString();

final isMachineOn = machineStatus.toUpperCase() == "ON";

// detect OFF → ON transition
if (isMachineOn && !previousMachineStatusOn) {
  lastMachineOnTime = DateTime.now();
}

previousMachineStatusOn = isMachineOn;
// 👆 END OF NEW BLOCK

print("FULL DATA = $result");
print("DRO RESULT:");
print("RESULT RECEIVED:");
print(result);

   if (!mounted) return;

setState(() {

  data = result;

  backendConnected = true;

  lastUpdate = DateTime.now();

  loading = false;

});

    print("DATA STORED:");
    print(data);
  } catch (e) {

  print(e);

  if (!mounted) return;

  setState(() {

    backendConnected = false;

  });

}
}

  Widget infoCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }

  Widget navButton(IconData icon, String label, Color color) {
    return Expanded(
      child: Container(
        height: 72,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  double calculateHealth() {
  double vib1 =
      (data["vibit1"]?["z_rms_velocity"] ?? 0).toDouble();

  double vib2 =
      (data["vibit2"]?["z_rms_velocity"] ?? 0).toDouble();

  if (vib1 == 0 && vib2 == 0) {
    return 0;
  }

  double vibration = vib1 > vib2 ? vib1 : vib2;

  if (vibration <= 0.5) return 100;
  if (vibration <= 1.0) return 90;
  if (vibration <= 2.0) return 75;
  if (vibration <= 3.0) return 60;
  if (vibration <= 5.0) return 40;

  return 20;
}
  
  Widget energyRow(String label, String value) {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
        ),
      ),

      Expanded(
        flex: 1,
        child: Text(
          value,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Smart Lathe Monitoring"),
        actions: [
IconButton(
  icon: const Icon(Icons.notifications_none),
  onPressed: () {
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const AlarmsScreen(),
  ),
);
  },
),
          SizedBox(width: 12),
          GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      ),
    );
  },
  child: const CircleAvatar(
    radius: 18,
    child: Icon(Icons.person),
  ),
),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
           Row(
  children: [
    Text(
      currentTime,
      style: const TextStyle(
        color: AppColors.textGrey,
        fontSize: 13,
      ),
    ),

    const Spacer(),

   CircleAvatar(

  radius: 5,

  backgroundColor:
      backendConnected
          ? Colors.green
          : Colors.red,
),

    const SizedBox(width: 8),

    Text(

  backendConnected

      ? "Connected"

      : "Disconnected",

  style: TextStyle(

    color: backendConnected

        ? Colors.green

        : Colors.red,

    fontWeight: FontWeight.bold,

  ),

),
  ],
),

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     if (lastMachineOnTime != null)
//       Text(
//         "Last Machine ON : "
//         "${lastMachineOnTime!.hour.toString().padLeft(2, '0')}:"
//         "${lastMachineOnTime!.minute.toString().padLeft(2, '0')}:"
//         "${lastMachineOnTime!.second.toString().padLeft(2, '0')}",
//         style: const TextStyle(
//           color: Colors.grey,
//           fontSize: 12,
//         ),
//       ),

//     const SizedBox(height: 4),

//     if (lastUpdate != null)
//       Text(
//         "Last API Update : "
//         "${lastUpdate!.hour.toString().padLeft(2, '0')}:"
//         "${lastUpdate!.minute.toString().padLeft(2, '0')}:"
//         "${lastUpdate!.second.toString().padLeft(2, '0')}",
//         style: const TextStyle(
//           color: Colors.grey,
//           fontSize: 12,
//         ),
//       ),
//   ],
// ),
        

// Padding(

//   padding: const EdgeInsets.only(top: 6),

//   child: Align(

//     alignment: Alignment.centerLeft,

//     child: Text(
//       "Last Machine ON : ${lastMachineOnTime!...}"

//       if (lastMachineOnTime != null)
//   Padding(
//     padding: const EdgeInsets.only(top: 6),
//     child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         "Last Machine ON : "
//         "${lastMachineOnTime!.hour.toString().padLeft(2, '0')}:"
//         "${lastMachineOnTime!.minute.toString().padLeft(2, '0')}:"
//         "${lastMachineOnTime!.second.toString().padLeft(2, '0')}",
//         style: const TextStyle(
//           color: Colors.grey,
//           fontSize: 12,
//         ),
//       ),
//     ),
//   ),

      // "${lastUpdate!.hour.toString().padLeft(2,'0')}:"

      // "${lastUpdate!.minute.toString().padLeft(2,'0')}:"

      // "${lastUpdate!.second.toString().padLeft(2,'0')}",
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    if (lastMachineOnTime != null)
      Text(
        "Last Machine ON : "
        "${lastMachineOnTime!.hour.toString().padLeft(2, '0')}:"
        "${lastMachineOnTime!.minute.toString().padLeft(2, '0')}:"
        "${lastMachineOnTime!.second.toString().padLeft(2, '0')}",
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),

    const SizedBox(height: 4),

    // if (lastUpdate != null)
    //   Text(
    //     "Last API Update : "
    //     "${lastUpdate!.hour.toString().padLeft(2, '0')}:"
    //     "${lastUpdate!.minute.toString().padLeft(2, '0')}:"
    //     "${lastUpdate!.second.toString().padLeft(2, '0')}",
    //     style: const TextStyle(
    //       color: Colors.grey,
    //       fontSize: 12,
    //     ),
    //   ),
  ],
),
  //     style: const TextStyle(

  //       color: Colors.grey,

  //       fontSize: 12,

  //     ),

  //   ),

  // ),

//),
MachineStatusCard(
  machineStatus:
      (data["machine"]?["status"] ?? "OFF").toString(),

  chuckStatus:
      (data["chuck"]?["chuck_on"] ?? 0),

  redBuzzer:
      (data["chuck"]?["red_buzzer"] ?? 0),
),

const SizedBox(height: 14),
SizedBox(
  height: 200,
  child: PositionGauge(
    xValue: (data["position"]?["x_position"] ?? 0).toDouble(),
    yValue: (data["position"]?["y_position"] ?? 0).toDouble(),
    cuttingSpeed:
        (data["position"]?["cutting_speed"] ?? 0).toDouble(),
    depthOfCutting:
        (data["position"]?["depth_of_cutting"] ?? 0).toDouble(),
  ),
),

const SizedBox(height: 14),

            // const SizedBox(height: 14),

//             SizedBox(
//               height: 360,
//               child: Row(
//             children: [
//   Expanded(
//     child: MachineStatusCard(
//   machineStatus:
//       (data["machine"]?["status"] ?? "OFF").toString(),

//   chuckStatus:
//       (data["chuck"]?["chuck_on"] ?? 0),

//   redBuzzer:
//       (data["chuck"]?["red_buzzer"] ?? 0),
// ),
//   ),
//   const SizedBox(width: 12),
//  Expanded(
//   child: ExactRpmGauge(
//     rpm: (data["vibit1"]?["rpm"] ?? 0).toDouble(),
//   ),
// ),
// ],
//               ),
//             ),

            // const SizedBox(height: 12),

         SizedBox(
  height: 190,
  child: Row(
    children: [

      Expanded(
        child: ExactRpmGauge(
          rpm: (data["vibit1"]?["rpm"] ?? 0).toDouble(),
        ),
      ),

      const SizedBox(width: 12),

      Expanded(
        child: ExactVibrationGauge(
          health: calculateHealth(),
        ),
      ),

    ],
  ),
),

const SizedBox(height: 14),
SizedBox(
  height: 180,
  child: TemperatureCard(
    headstockTemp:
        (data["vibit2"]?["temperature"] ?? 0).toDouble(),
    toolpostTemp:
        (data["vibit1"]?["temperature"] ?? 0).toDouble(),
    headstockVibration:
        (data["vibit2"]?["z_rms_velocity"] ?? 0).toDouble(),
    toolpostVibration:
        (data["vibit1"]?["z_rms_velocity"] ?? 0).toDouble(),
  ),
),

const SizedBox(height: 14),
SizedBox(
  width: double.infinity,
  child: infoCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "ENERGY SUMMARY",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 20),

        energyRow(
          "Voltage",
          "${data["energy"]?["data"]?["avg_voltage_LN"] ?? 0} V",
        ),

        const SizedBox(height: 12),

        energyRow(
          "Current",
          "${data["energy"]?["data"]?["avg_current"] ?? 0} A",
        ),

        const SizedBox(height: 12),

        energyRow(
          "Power",
          "${data["energy"]?["data"]?["total_kW"] ?? 0} kW",
        ),

        const SizedBox(height: 12),

        energyRow(
          "Frequency",
          "${data["energy"]?["data"]?["frequency"] ?? 0} Hz",
        ),

        const SizedBox(height: 12),

        energyRow(
          "PF",
          "${data["energy"]?["data"]?["avg_PF"] ?? 0}",
        ),

        const SizedBox(height: 12),

        energyRow(
          "Avg Volt LN",
          "${data["energy"]?["data"]?["avg_voltage_LN"] ?? 0} V",
        ),

        const SizedBox(height: 12),

        energyRow(
          "Avg Volt LL",
          "${data["energy"]?["data"]?["avg_voltage_LL"] ?? 0} V",
        ),
      ],
    ),
  ),
),

const SizedBox(height: 14),

//             SizedBox(
//               height: 500,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: infoCard(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                               const  Text(
//                             "ENERGY SUMMARY",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 20),

//                           energyRow(
//   "Voltage",
//   "${(data["energy"]?["data"]?["avg_voltage_LN"] ?? 0)} V",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "Current",
//   "${(data["energy"]?["data"]?["avg_current"] ?? 0)} A",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "Power",
//   "${(data["energy"]?["data"]?["total_kW"] ?? 0)} kW",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "Frequency",
//   "${(data["energy"]?["data"]?["frequency"] ?? 0)} Hz",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "PF",
//   "${(data["energy"]?["data"]?["avg_PF"] ?? 0)}",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "Avg Volt LN",
//   "${(data["energy"]?["data"]?["avg_voltage_LN"] ?? 0)} V",
// ),

// const SizedBox(height: 12),

// energyRow(
//   "Avg Volt LL",
//   "${(data["energy"]?["data"]?["avg_voltage_LL"] ?? 0)} V",
// ),
      
//   ],
// ),
// ),
//     ),
                  
//             const SizedBox(width: 12),
//                  Expanded(
//   child: PositionGauge(
//   xValue:
//       (data["position"]?["x_position"] ?? 0).toDouble(),

//   yValue:
//       (data["position"]?["y_position"] ?? 0).toDouble(),

//   cuttingSpeed:
//       (data["position"]?["cutting_speed"] ?? 0).toDouble(),

//   depthOfCutting:
//       (data["position"]?["depth_of_cutting"] ?? 0).toDouble(),
// ),
// ),
//                 ],
//               ),
//             ),

const SizedBox(height: 14),
            
                      ],
        ),
      ),
    );
  }
}