import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class HealthGauge extends StatelessWidget {
  final double value;

  const HealthGauge({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Text(
            "VIBRATION HEALTH",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showTicks: false,
                  showLabels: false,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.15,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: [
                    RangePointer(
                      value: value,
                      width: 0.15,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.green,
                    )
                  ],
                  annotations: [
                    GaugeAnnotation(
                      widget: Text(
                        "${value.toInt()}%",
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}