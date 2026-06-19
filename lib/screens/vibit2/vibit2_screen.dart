import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/widgets/cards/health_summary_card.dart';
import 'package:smart_lathe_frontend/widgets/gauges/exact_rpm_gauge.dart';
import 'package:smart_lathe_frontend/widgets/gauges/small_metric_gauge.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
class Vibit2Screen extends StatefulWidget {
  const Vibit2Screen({super.key});

  @override
  State<Vibit2Screen> createState() => _Vibit2ScreenState();
}

class _Vibit2ScreenState extends State<Vibit2Screen> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await ApiService.getData();

    setState(() {
      data = result;
    });
  }

  Widget topInfo(String title, String value, Color color) {
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
                fontSize: 11,
                color: AppColors.textGrey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
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
        title: const
        Text(
  "VIBIT 2 - Head Stock Monitoring",
)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     // topInfo("STATUS", "ONLINE", Colors.green),
            //     // const SizedBox(width: 8),
            //     // topInfo(
            //     //   "REBOOT COUNT",
            //     //   "${data["vibit2"]?["reboot_count"] ?? 0}",
            //     //   Colors.green,
            //     // ),
            //     const SizedBox(width: 8),
            //     topInfo("LAST UPDATED", "10:31:12 AM", Colors.black),
            //   ],
            // ),

            const SizedBox(height: 14),

           
            sectionTitle("ACCELERATION"),

            SizedBox(
              height: 300,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  SmallMetricGauge(
  title: "X RMS",
  value: (data["vibit2"]?["x_rms_acceleration"] ?? 0).toDouble(),
  max: 1,
  unit: "g",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "Y RMS",
  value: (data["vibit2"]?["y_rms_acceleration"] ?? 0).toDouble(),
  max: 1,
  unit: "g",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "Z RMS",
  value: (data["vibit2"]?["z_rms_acceleration"] ?? 0).toDouble(),
  max: 1,
  unit: "g",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "X PEAK",
  value: (data["vibit2"]?["x_peak_acceleration"] ?? 0).toDouble(),
  max: 2,
  unit: "g",
  color: Colors.orange,
),

SmallMetricGauge(
  title: "Y PEAK",
  value: (data["vibit2"]?["y_peak_acceleration"] ?? 0).toDouble(),
  max: 2,
  unit: "g",
  color: Colors.orange,
),

SmallMetricGauge(
  title: "Z PEAK",
  value: (data["vibit2"]?["z_peak_acceleration"] ?? 0).toDouble(),
  max: 2,
  unit: "g",
  color: Colors.orange,
),
                ],
              ),
            ),

            const SizedBox(height: 16),

            sectionTitle("VELOCITY"),

            SizedBox(
              height: 300,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  SmallMetricGauge(
  title: "X RMS",
  value: (data["vibit2"]?["x_rms_velocity"] ?? 0).toDouble(),
  max: 5,
  unit: "mm/s",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "Y RMS",
  value: (data["vibit2"]?["y_rms_velocity"] ?? 0).toDouble(),
  max: 5,
  unit: "mm/s",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "Z RMS",
  value: (data["vibit2"]?["z_rms_velocity"] ?? 0).toDouble(),
  max: 5,
  unit: "mm/s",
  color: Colors.blue,
),

SmallMetricGauge(
  title: "X PEAK",
  value: (data["vibit2"]?["x_peak_velocity"] ?? 0).toDouble(),
  max: 6,
  unit: "mm/s",
  color: Colors.orange,
),

SmallMetricGauge(
  title: "Y PEAK",
  value: (data["vibit2"]?["y_peak_velocity"] ?? 0).toDouble(),
  max: 6,
  unit: "mm/s",
  color: Colors.orange,
),

SmallMetricGauge(
  title: "Z PEAK",
  value: (data["vibit2"]?["z_peak_velocity"] ?? 0).toDouble(),
  max: 6,
  unit: "mm/s",
  color: Colors.orange,
),
                ],
              ),
            ),

            // const SizedBox(height: 16),

            // const HealthSummaryCard(),
          ],
        ),
      ),
    );
  }
}