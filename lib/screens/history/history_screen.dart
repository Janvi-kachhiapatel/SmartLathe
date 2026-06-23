import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

//String selectedRange = "24H";

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
  //String selectedRange = "24H";
}

class _HistoryScreenState extends State<HistoryScreen> {
  String selectedParameter = "RPM History";

  // String exportType = "RPM";

String exportDuration = "24H";
//String exportDashboard = "All Data";
//String exportDashboard = "Position";
List<String> selectedDashboards = [];

String exportParameter = "All Parameters";

List<String> exportParameters = [
  "All Parameters",
];

List<String> selectedParameters = [];

DateTime? startDate;
DateTime? endDate;

  String selectedRange = "24H";
  
    List<double> historyData = [];

    double minValue = 0;
    double avgValue = 0;
    double maxValue = 0;

    Future<void> downloadFile(
  String endpoint,
  String extension,
) async {

  try {

    if (selectedDashboards.isEmpty) {

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Please select at least one dashboard",
      ),
    ),
  );

  return;
}

if (selectedParameters.isEmpty) {

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        "Please select at least one parameter",
      ),
    ),
  );

  return;
}

    final dio = Dio();

    final dir =
    Directory("/storage/emulated/0/Download");

    final fileName =
        "lathe_export_${DateTime.now().millisecondsSinceEpoch}.$extension";

    final savePath =
        "${dir.path}/$fileName";

    await dio.post(
      "http://10.10.14.121:8001$endpoint",

      data: {
        "dashboards": selectedDashboards,
        "parameters": selectedParameters,
        "duration": exportDuration,

        "start_date":
            startDate?.toIso8601String(),

        "end_date":
            endDate?.toIso8601String(),
      },

      options: Options(
        responseType: ResponseType.bytes,
      ),
    ).then((response) async {

      File(savePath)
          .writeAsBytesSync(response.data);
          print("FILE SAVED = $savePath");

      await OpenFile.open(savePath);

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Saved: $fileName",
          ),
        ),
      );
    });

  } catch (e, s) {

  print("DOWNLOAD ERROR:");
  print(e);
  print(s);

  ScaffoldMessenger.of(context)
      .showSnackBar(
      SnackBar(
        content: Text(
          "Download Failed",
        ),
      ),
    );
  }
}

    void updateParameterList() {

  exportParameters = [
    "All Parameters",
  ];

  if (selectedDashboards.contains("Position")) {
    exportParameters.addAll([
      "x_position",
      "y_position",
      "cutting_speed",
      "depth_of_cutting",
    ]);
  }

  if (selectedDashboards.contains("Energy")) {
    exportParameters.addAll([
      "voltage_V1N",
      "voltage_V2N",
      "voltage_V3N",
      "avg_voltage_LN",
      "voltage_V12",
      "voltage_V23",
      "voltage_V31",
      "avg_voltage_LL",
      "current_I1",
      "current_I2",
      "current_I3",
      "avg_current",
      "kW1",
      "kW2",
      "kW3",
      "total_kW",
      "PF1",
      "PF2",
      "PF3",
      "avg_PF",
      "frequency",
      "total_net_kwh_dg",
      "total_net_kvarh_dg",
      "total_net_kvah_dg",
      "max_dmd_active_power",
      "max_dmd_reactive_power",
      "max_dmd_apparent_power",
      "kwh1_import",
      "kwh2_import",
      "kwh3_import",
      "kwh1_export",
      "kwh2_export",
      "kwh3_export",
      "total_kwh_import",
      "total_kwh_export",
      "kvarh1_import",
      "kVA1",
      "kVA2",
      "kVA3",
      "kVAR1",
      "kVAR2",
      "kVAR3",
      "kvar1",
      "kvar2",
      "kvar3",
      "kva1",
      "kva2",
      "kva3",
      "total_kw",
      "total_kvar",
      "total_kva",
      "total_net_kwh",
      "total_net_kvarh",
    ]);
  }

  if (selectedDashboards.contains("VIBIT1")) {
    exportParameters.addAll([
       "temperature_vibit1",

    "x_rms_acceleration_vibit1",
    "y_rms_acceleration_vibit1",
    "z_rms_acceleration_vibit1",

    "x_rms_velocity_vibit1",
    "y_rms_velocity_vibit1",
    "z_rms_velocity_vibit1",

    "x_peak_acceleration_vibit1",
    "y_peak_acceleration_vibit1",
    "z_peak_acceleration_vibit1",

    "x_peak_velocity_vibit1",
    "y_peak_velocity_vibit1",
    "z_peak_velocity_vibit1",

    "rpm",
    ]);
  }

  if (selectedDashboards.contains("VIBIT2")) {
    exportParameters.addAll([
      "temperature_vibit2",

    "x_rms_acceleration_vibit2",
    "y_rms_acceleration_vibit2",
    "z_rms_acceleration_vibit2",

    "x_rms_velocity_vibit2",
    "y_rms_velocity_vibit2",
    "z_rms_velocity_vibit2",

    "x_peak_acceleration_vibit2",
    "y_peak_acceleration_vibit2",
    "z_peak_acceleration_vibit2",

    "x_peak_velocity_vibit2",
    "y_peak_velocity_vibit2",
    "z_peak_velocity_vibit2",

    "rpm",
    ]);
  }

  if (selectedDashboards.contains("Machine")) {
    exportParameters.addAll([
      "status",
      "timestamp",
    ]);
  }

  if (selectedDashboards.contains("Chuck")) {
    exportParameters.addAll([
      "chuck_on",
      "red_buzzer",
    ]);
  }

  exportParameters = exportParameters.toSet().toList();

  exportParameter = exportParameters.first;
}

    @override
    void initState() {
      super.initState();
      loadHistoryData();
      updateParameterList();
      //print("COUNT = ${historyData.length}");
    }

    Future<void> loadHistoryData() async {
    int limit = 50;
    switch (selectedRange) {

  case "1H":
    limit = 60;
    break;

  case "6H":
    limit = 360;
    break;

  case "12H":
    limit = 720;
    break;

  case "24H":
    limit = 1440;
    break;

  case "7D":
    limit = 5000;
    break;

  case "30D":
    limit = 20000;
    break;
}
  if (selectedParameter == "RPM History") {
    historyData = await ApiService.getRpmHistory(limit);
  }

  if (selectedParameter == "Temperature History") {
    historyData = await ApiService.getTemperatureHistory(limit);
  }

  if (selectedParameter == "Vibration History") {
    historyData = await ApiService.getVibrationHistory(limit);
  }

  print("HISTORY DATA = $historyData");

if (historyData.isNotEmpty) {
  List<double> values = historyData;

  // List<double> values = historyData.map<double>((e) {

  //   if (e is Map) {
  //     return (e["value"] ?? 0).toDouble();
  //   }

  //   return (e ?? 0).toDouble();

  // }).toList();

  minValue = values.reduce((a, b) => a < b ? a : b);

  maxValue = values.reduce((a, b) => a > b ? a : b);

  avgValue =
      values.reduce((a, b) => a + b) / values.length;
}

if (!mounted) return;

setState(() {});

  print("COUNT = ${historyData.length}");
  print("DATA = $historyData");
}

  Widget whiteCard(Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }

  Widget metricCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
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
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rangeButton(String text) {
  final active = selectedRange == text;

  return GestureDetector(
    onTap: () async {
      setState(() {
        selectedRange = text;
      });

      await loadHistoryData();
    },
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: active ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

//   List<FlSpot> chartData() {

//   return historyData.asMap().entries.map(
//     (e) {

//       double value = 0;

//       if (e.value is Map) {
//         value = (e.value["value"] ?? 0).toDouble();
//       } else {
//         value = (e.value ?? 0).toDouble();
//       }

//       return FlSpot(
//         e.key.toDouble(),
//         value,
//       );

//     },
//   ).toList();
// }

List<FlSpot> chartData() {
  return historyData.asMap().entries.map(
    (e) => FlSpot(
      e.key.toDouble(),
      e.value,
    ),
  ).toList();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: const Text("History & Trends"),
      
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            whiteCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PARAMETER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  DropdownButton<String>(
  value: selectedParameter,
  isExpanded: true,
  items: const [
    DropdownMenuItem(
      value: "RPM History",
      child: Text("RPM History"),
    ),
    DropdownMenuItem(
      value: "Temperature History",
      child: Text("Temperature History"),
    ),
    DropdownMenuItem(
      value: "Vibration History",
      child: Text("Vibration History"),
    ),
  ],
  onChanged: (value) {
    setState(() {
      selectedParameter = value!;
    });

    loadHistoryData();
  },
),

const SizedBox(height: 18),

                  const SizedBox(height: 18),

                  const Text(
                    "TREND CHART",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    height: 280,
                    child: LineChart(
                      LineChartData(
                        minY: minValue - 1,
                        maxY: maxValue + 1,
                        gridData: FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: chartData(),
                            isCurved: true,
                            color: Colors.blue,
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

            const SizedBox(height: 18),

            Row(
              children: [
                metricCard(
  "MIN",
  minValue.toStringAsFixed(2),
  Colors.green,
),

metricCard(
  "AVG",
  avgValue.toStringAsFixed(2),
  Colors.orange,
),

metricCard(
  "MAX",
  maxValue.toStringAsFixed(2),
  Colors.red,
),
              ],
            ),

            const SizedBox(height: 18),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "QUICK RANGE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                rangeButton("1H"),
                rangeButton("6H"),
                rangeButton("12H"),
                rangeButton("24H"),
                rangeButton("7D"),
                rangeButton("30D"),
              ],
            ),
            const SizedBox(height: 30),

const Align(
  alignment: Alignment.centerLeft,
  child: Text(
    "EXPORT DATA",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  ),
),

const SizedBox(height: 12),





const SizedBox(height: 12),

  Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.border,
    ),
  ),
  child: Column(
    children: [

      CheckboxListTile(
        value:
            selectedDashboards.length == 6,
        title: const Text("ALL"),
        onChanged: (value) {

          setState(() {

            if (value == true) {

  selectedDashboards = [
    "Position",
    "Energy",
    "VIBIT1",
    "VIBIT2",
    "Machine",
    "Chuck",
  ];

  updateParameterList();
  selectedParameters.clear();

} else {

  selectedDashboards.clear();

  updateParameterList();
  selectedParameters.clear();

}

          });

        },
      ),

      ...[
        "Position",
        "Energy",
        "VIBIT1",
        "VIBIT2",
        "Machine",
        "Chuck",
      ].map(
        (dashboard) => CheckboxListTile(
          value: selectedDashboards.contains(
            dashboard,
          ),
          title: Text(dashboard),
          onChanged: (value) {

            setState(() {

              if (value == true) {
  selectedDashboards.add(dashboard);
} else {
  selectedDashboards.remove(dashboard);
}

updateParameterList();

selectedParameters.clear();

            });

          },
        ),
      ),
    ],
  ),
),

CheckboxListTile(
  value:
      selectedParameters.length ==
      exportParameters.length - 1,

  title: const Text("ALL"),

  onChanged: (value) {

    setState(() {

      if (value == true) {

        selectedParameters =
            exportParameters
                .where(
                  (e) =>
                      e !=
                      "All Parameters",
                )
                .toList();

      } else {

        selectedParameters.clear();

      }

    });

  },
),
const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.border,
    ),
  ),
  child: Column(
    children: exportParameters
        .where((e) => e != "All Parameters")
        .map(
          (param) => CheckboxListTile(
            value: selectedParameters.contains(param),

            title: Text(
              param,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),

           onChanged: (value) {
  setState(() {

    if (value == true) {
      selectedParameters.add(param);
    } else {
      selectedParameters.remove(param);
    }

  });
},
          ),
        )
        .toList(),
  ),
),
// Container(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 12,
//   ),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12),
//     border: Border.all(
//       color: AppColors.border,
//     ),
//   ),
//   child: DropdownButton<String>(
//     value: exportParameter,
//     isExpanded: true,
//     underline: const SizedBox(),
//     items: exportParameters.map((e) {
//       return DropdownMenuItem(
//         value: e,
//         child: Text(e),
//       );
//     }).toList(),
//     onChanged: (value) {
//       setState(() {
//         exportParameter = value!;
//       });
//     },
//   ),
// ),

const SizedBox(height: 12),

DropdownButton<String>(
  value: exportDuration,
  isExpanded: true,
  items: const [
    DropdownMenuItem(
      value: "1H",
      child: Text("Last 1 Hour"),
    ),
    DropdownMenuItem(
      value: "24H",
      child: Text("Last 24 Hours"),
    ),
    DropdownMenuItem(
      value: "7D",
      child: Text("Last 7 Days"),
    ),
    DropdownMenuItem(
      value: "30D",
      child: Text("Last 30 Days"),
    ),
    DropdownMenuItem(
      value: "CUSTOM",
      child: Text("Custom Date Range"),
    ),
  ],
  onChanged: (value) {
    setState(() {
      exportDuration = value!;
    });
  },
),

const SizedBox(height: 12),
if (exportDuration == "CUSTOM") ...[
  const SizedBox(height: 12),

  ElevatedButton(
    onPressed: () async {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now(),
      );
      if (startDate != null &&
    endDate != null &&
    endDate!.isBefore(startDate!))
      ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "End date must be after start date",
              ),
            ),
          );

      if (picked != null) {
        setState(() {
          startDate = picked;
        });
      }
    },
    child: Text(
      startDate == null
          ? "Select Start Date"
          : startDate.toString().split(" ")[0],
    ),
  ),

  const SizedBox(height: 10),

  ElevatedButton(
    onPressed: () async {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        setState(() {
          endDate = picked;
        });
      }
    },
    child: Text(
      endDate == null
          ? "Select End Date"
          : endDate.toString().split(" ")[0],
    ),
  ),

  const SizedBox(height: 20),
],

const SizedBox(height: 20),

Row(
  children: [

    Expanded(
      child: ElevatedButton(
        onPressed: () async {

  await downloadFile(
    "/export/pdf",
    "pdf",
  );

},
        child: const Text("DOWNLOAD PDF"),
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: ElevatedButton(
        onPressed: () async {

  await downloadFile(
    "/export/csv",
    "csv",
  );

},
        child: const Text("DOWNLOAD CSV"),
      ),
    ),
  ],
),
          ],
        ),
      ),
    );
  }
}