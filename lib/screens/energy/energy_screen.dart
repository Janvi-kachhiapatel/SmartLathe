import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
//import 'package:smart_lathe_frontend/widgets/cards/status_metric_card.dart';
//import 'package:smart_lathe_frontend/widgets/gauges/mini_arc_gauge.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'package:smart_lathe_frontend/screens/energy/energy_details_screen.dart';
import 'package:fl_chart/fl_chart.dart';

class EnergyScreen extends StatefulWidget {
  const EnergyScreen({super.key});

  @override
  State<EnergyScreen> createState() => _EnergyScreenState();
}

class _EnergyScreenState extends State<EnergyScreen> {
  Map<String, dynamic> data = {};

  List<double> powerHistory = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await ApiService.getData();

    powerHistory =
    await ApiService.getPowerHistory(100);
    
   

    setState(() {
      data = result;
    });
  }

   List<FlSpot> powerChartData() {

  return powerHistory
      .asMap()
      .entries
      .map(
        (e) => FlSpot(
          e.key.toDouble(),
          e.value,
        ),
      )
      .toList();
}

  // Widget sectionTitle(String text) {
  //   return Align(
  //     alignment: Alignment.centerLeft,
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: 4, bottom: 8),
  //       child: Text(
  //         text,
  //         style: const TextStyle(
  //           fontSize: 14,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }



  Widget whiteCard(Widget child) {
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

  Widget energyCard(
  String title,
  String value,
  Color color,
  IconData icon,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: AppColors.border),
    ),
    child: Row(
      children: [

        Icon(
          icon,
          color: color,
          size: 40,
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                value,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: const Text("Energy Monitoring"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            energyCard(
  "Voltage",
  "${data["energy"]?["data"]?["avg_voltage_LN"] ?? 0} V",
  Colors.blue,
  Icons.bolt,
),

energyCard(
  "Current",
  "${data["energy"]?["data"]?["avg_current"] ?? 0} A",
  Colors.green,
  Icons.electric_meter,
),

energyCard(
  "Power",
  "${data["energy"]?["data"]?["total_kW"] ?? 0} kW",
  Colors.orange,
  Icons.flash_on,
),

energyCard(
  "Power Factor",
  "${data["energy"]?["data"]?["avg_PF"] ?? 0}",
  Colors.purple,
  Icons.speed,
),

energyCard(
  "Energy",
  "${data["energy"]?["data"]?["total_net_kwh"] ?? 0} kWh",
  Colors.teal,
  Icons.battery_charging_full,
),

energyCard(
  "Frequency",
  "${data["energy"]?["data"]?["frequency"] ?? 0} Hz",
  Colors.red,
  Icons.show_chart,
),
ElevatedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const EnergyDetailsScreen(),
      ),
    );
  },
  icon: const Icon(Icons.analytics),
  label: const Text("More Energy Details"),
),

// const SizedBox(height: 20),

// const Align(
//   alignment: Alignment.centerLeft,
//   child: Text(
//     "POWER TREND",
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     ),
//   ),
// ),

const SizedBox(height: 12),

SizedBox(
  height: 250,
  child: LineChart(
    LineChartData(
      gridData: FlGridData(show: true),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: powerChartData(),
          isCurved: true,
          color: Colors.orange,
          barWidth: 4,
          dotData: FlDotData(show: false),
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


//             /// VOLTAGE
//             whiteCard(
//               Column(
//                 children: [
//                   sectionTitle("VOLTAGE (V)"),
//                   SizedBox(
//                     height: 120,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "V1N",
//                             value: (data["energy"]?["data"]?["voltage_v1n"] ?? 0).toDouble(),
//                             max: 300,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "V2N",
//                             value: (data["energy"]?["data"]?["voltage_v2n"] ?? 0).toDouble(),
//                             max: 300,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "V3N",
//                             value: (data["energy"]?["data"]?["voltage_v3n"] ?? 0).toDouble(),
//                             max: 300,
//                             color: Colors.blue,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "AVG",
//                             value: (data["energy"]?["data"]?["avg_voltage_LN"] ?? 0).toDouble(),
//                             max: 300,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             /// CURRENT
//             whiteCard(
//               Column(
//                 children: [
//                   sectionTitle("CURRENT (A)"),
//                   SizedBox(
//                     height: 120,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "I1",
//                             value: (data["energy"]?["data"]?["current_i1"] ?? 0).toDouble(),
//                             max: 30,
//                             color: Colors.green,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "I2",
//                             value: (data["energy"]?["data"]?["current_i2"] ?? 0).toDouble(),
//                             max: 30,
//                             color: Colors.green,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "I3",
//                             value: (data["energy"]?["data"]?["current_i3"] ?? 0).toDouble(),
//                             max: 30,
//                             color: Colors.green,
//                           ),
//                         ),
//                         Expanded(
//                           child: MiniArcGauge(
//                             title: "AVG",
//                             value: (data["energy"]?["data"]?["avg_current"] ?? 0).toDouble(),
//                             max: 30,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             /// POWER
//             whiteCard(
//               Column(
//                 children: [
//                   sectionTitle("POWER"),
//                   SizedBox(
//                     height: 140,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: StatusMetricCard(
//                             title: "ACTIVE POWER",
//                             value: "${data["energy"]?["data"]?["total_kW"] ?? 0}",
//                             subtitle: "kW",
//                             color: Colors.orange,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: StatusMetricCard(
//                             title: "REACTIVE POWER",
//                            value: "${data["energy"]?["data"]?["total_kVAR"] ?? 0}",
//                             subtitle: "kVAR",
//                             color: Colors.orange,
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: StatusMetricCard(
//                             title: "APPARENT POWER",
//                             value: "${data["energy"]?["data"]?["total_kVA"] ?? 0}",
//                             subtitle: "kVA",
//                             color: Colors.orange,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             /// Frequency + PF
//             Row(
//               children: [
//                 Expanded(
//                   child: whiteCard(
//                     SizedBox(
//                       height: 140,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.show_chart,
//                               size: 34, color: Colors.blue),
//                           SizedBox(height: 10),
//                           Text(
//                             "FREQUENCY",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//   "${data["energy"]?["data"]?["frequency"] ?? 0} Hz",
//                             style: TextStyle(
//                               fontSize: 22,
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: whiteCard(
//                     SizedBox(
//                       height: 140,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                           children: [             
//                                Icon(Icons.speed,
//                               size: 34, color: Colors.orange),
//                           SizedBox(height: 10),
//                           Text(
//                             "POWER FACTOR",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8),
//                          Text(
//   "${data["energy"]?["data"]?["avg_PF"] ?? 0}",
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             /// ENERGY
//             SizedBox(
//               height: 150,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "kWh",
//                      value: "${data["energy"]?["data"]?["total_kWh_import"] ?? 0}",
//                       subtitle: "Total Energy",
//                       color: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "kVARh",
//                      value: "${data["energy"]?["data"]?["total_kVARh"] ?? 0}",
//                       subtitle: "Reactive Energy",
//                       color: Colors.blue,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "kVAh",
//                      value: "${data["energy"]?["data"]?["total_kVAh"] ?? 0}",
//                       subtitle: "Apparent Energy",
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),
//             const SizedBox(height: 20),

// ElevatedButton.icon(
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const EnergyDetailsScreen(),
//       ),
//     );
//   },
//   icon: const Icon(Icons.analytics),
//   label: const Text("More Energy Details"),
// ),

//             /// STATUS
//             SizedBox(
//               height: 140,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "SYSTEM HEALTH",
//                       value: "GOOD",
//                       subtitle: "",
//                       color: Colors.green,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "OVERLOAD",
//                       value: "NORMAL",
//                       subtitle: "",
//                       color: Colors.green,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: StatusMetricCard(
//                       title: "IMBALANCE",
//                       value: "2.1%",
//                       subtitle: "",
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }