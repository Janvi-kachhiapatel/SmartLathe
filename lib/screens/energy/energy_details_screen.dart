import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'package:smart_lathe_frontend/widgets/gauges/mini_arc_gauge.dart';

class EnergyDetailsScreen extends StatefulWidget {
  const EnergyDetailsScreen({super.key});

  @override
  State<EnergyDetailsScreen> createState() =>
      _EnergyDetailsScreenState();
}

class _EnergyDetailsScreenState
    extends State<EnergyDetailsScreen> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Energy Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            // LINE VOLTAGE
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "LINE VOLTAGE (V)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 120,
                    child: Row(
                      children: [

                        Expanded(
                          child: MiniArcGauge(
                            title: "V12",
                            value: (data["energy"]?["data"]?["voltage_V12"] ?? 0).toDouble(),
                            max: 500,
                            color: Colors.blue,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "V23",
                            value: (data["energy"]?["data"]?["voltage_V23"] ?? 0).toDouble(),
                            max: 500,
                            color: Colors.blue,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "V31",
                            value: (data["energy"]?["data"]?["voltage_V31"] ?? 0).toDouble(),
                            max: 500,
                            color: Colors.blue,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "AVG",
                            value: (data["energy"]?["data"]?["avg_voltage_LL"] ?? 0).toDouble(),
                            max: 500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // CURRENT
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "CURRENT (A)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 120,
                    child: Row(
                      children: [

                        Expanded(
                          child: MiniArcGauge(
                            title: "I1",
                            value: (data["energy"]?["data"]?["current_I1"] ?? 0).toDouble(),
                            max: 20,
                            color: Colors.green,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "I2",
                            value: (data["energy"]?["data"]?["current_I2"] ?? 0).toDouble(),
                            max: 20,
                            color: Colors.green,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "I3",
                            value: (data["energy"]?["data"]?["current_I3"] ?? 0).toDouble(),
                            max: 20,
                            color: Colors.green,
                          ),
                        ),

                        Expanded(
                          child: MiniArcGauge(
                            title: "AVG",
                            value: (data["energy"]?["data"]?["avg_current"] ?? 0).toDouble(),
                            max: 20,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
                const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "POWER FACTOR",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      SizedBox(
        height: 120,
        child: Row(
          children: [

            Expanded(
              child: MiniArcGauge(
                title: "PF1",
                value: (data["energy"]?["data"]?["PF1"] ?? 0).toDouble().abs(),
                max: 1,
                color: Colors.orange,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "PF2",
                value: (data["energy"]?["data"]?["PF2"] ?? 0).toDouble().abs(),
                max: 1,
                color: Colors.orange,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "PF3",
                value: (data["energy"]?["data"]?["PF3"] ?? 0).toDouble().abs(),
                max: 1,
                color: Colors.orange,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "AVG",
                value: (data["energy"]?["data"]?["avg_PF"] ?? 0).toDouble().abs(),
                max: 1,
                color: Colors.orange,
              ),
            ),

          ],
        ),
      ),

    ],
  ),
),

        const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "ACTIVE POWER (kW)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      SizedBox(
        height: 120,
        child: Row(
          children: [

            Expanded(
              child: MiniArcGauge(
                title: "kW1",
                value: (data["energy"]?["data"]?["kW1"] ?? 0)
                    .toDouble()
                    .abs(),
                max: 10,
                color: Colors.red,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "kW2",
                value: (data["energy"]?["data"]?["kW2"] ?? 0)
                    .toDouble()
                    .abs(),
                max: 10,
                color: Colors.red,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "kW3",
                value: (data["energy"]?["data"]?["kW3"] ?? 0)
                    .toDouble()
                    .abs(),
                max: 10,
                color: Colors.red,
              ),
            ),

            Expanded(
              child: MiniArcGauge(
                title: "TOTAL",
                value: (data["energy"]?["data"]?["total_kW"] ?? 0)
                    .toDouble()
                    .abs(),
                max: 10,
                color: Colors.red,
              ),
            ),

          ],
        ),
      ),

    ],
  ),
),

            const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "ENERGY IMPORT (kWh)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      Row(
        children: [

          Expanded(
            child: MiniArcGauge(
              title: "kWh1",
              value: (data["energy"]?["data"]?["kwh1_import"] ?? 0).toDouble(),
              max: 100,
              color: Colors.blue,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kWh2",
              value: (data["energy"]?["data"]?["kwh2_import"] ?? 0).toDouble(),
              max: 100,
              color: Colors.blue,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kWh3",
              value: (data["energy"]?["data"]?["kwh3_import"] ?? 0).toDouble(),
              max: 100,
              color: Colors.blue,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "TOTAL",
              value: (data["energy"]?["data"]?["total_kwh_import"] ?? 0).toDouble(),
              max: 100,
              color: Colors.blue,
            ),
          ),

        ],
      ),
    ],
  ),
),    
        const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "MAXIMUM DEMAND",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      Row(
        children: [

          Expanded(
            child: MiniArcGauge(
              title: "MD kW",
              value: (data["energy"]?["data"]?["max_dmd_active_power"] ?? 0).toDouble(),
              max: 10,
              color: Colors.red,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "MD kVAR",
              value: (data["energy"]?["data"]?["max_dmd_reactive_power"] ?? 0).toDouble(),
              max: 10,
              color: Colors.orange,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "MD kVA",
              value: (data["energy"]?["data"]?["max_dmd_apparent_power"] ?? 0).toDouble(),
              max: 10,
              color: Colors.blue,
            ),
          ),

        ],
      ),
    ],
  ),
),

       const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "DG ENERGY",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      Row(
        children: [

          Expanded(
            child: MiniArcGauge(
              title: "kWh DG",
              value: (data["energy"]?["data"]?["total_net_kwh_dg"] ?? 0).toDouble(),
              max: 100,
              color: Colors.blue,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kVARh DG",
              value: (data["energy"]?["data"]?["total_net_kvarh_dg"] ?? 0).toDouble(),
              max: 100,
              color: Colors.orange,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kVAh DG",
              value: (data["energy"]?["data"]?["total_net_kvah_dg"] ?? 0).toDouble(),
              max: 100,
              color: Colors.green,
            ),
          ),

        ],
      ),
    ],
  ),
), 

            const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "ENERGY EXPORT (kWh)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      Row(
        children: [

          Expanded(
            child: MiniArcGauge(
              title: "kWh1",
              value: (data["energy"]?["data"]?["kwh1_export"] ?? 0).toDouble(),
              max: 100,
              color: Colors.purple,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kWh2",
              value: (data["energy"]?["data"]?["kwh2_export"] ?? 0).toDouble(),
              max: 100,
              color: Colors.purple,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "kWh3",
              value: (data["energy"]?["data"]?["kwh3_export"] ?? 0).toDouble(),
              max: 100,
              color: Colors.purple,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "TOTAL",
              value: (data["energy"]?["data"]?["total_kwh_export"] ?? 0).toDouble(),
              max: 100,
              color: Colors.purple,
            ),
          ),

        ],
      ),
    ],
  ),
),

        const SizedBox(height: 12),

Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [

      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "SYSTEM SUMMARY",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      const SizedBox(height: 16),

      Row(
        children: [

          Expanded(
            child: MiniArcGauge(
              title: "Freq",
              value: (data["energy"]?["data"]?["frequency"] ?? 0).toDouble(),
              max: 60,
              color: Colors.blue,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "Avg LN",
              value: (data["energy"]?["data"]?["avg_voltage_LN"] ?? 0).toDouble(),
              max: 300,
              color: Colors.green,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "Avg LL",
              value: (data["energy"]?["data"]?["avg_voltage_LL"] ?? 0).toDouble(),
              max: 500,
              color: Colors.orange,
            ),
          ),

          Expanded(
            child: MiniArcGauge(
              title: "Avg PF",
              value: (data["energy"]?["data"]?["avg_PF"] ?? 0).toDouble(),
              max: 1,
              color: Colors.red,
            ),
          ),

        ],
      ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }
}