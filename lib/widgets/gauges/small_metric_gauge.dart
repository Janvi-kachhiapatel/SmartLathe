import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class SmallMetricGauge extends StatelessWidget {
  final String title;
  final double value;
  final double max;
  final String unit;
  final Color color;

  const SmallMetricGauge({
    super.key,
    required this.title,
    required this.value,
    required this.max,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: max,
                  startAngle: 180,
                  endAngle: 0,
                  showTicks: false,
                  showLabels: false,
                  ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: max,
                      color: color.withOpacity(0.25),
                    ),
                  ],
                  pointers: [
                    NeedlePointer(
                      value: value,
                      needleColor: color,
                    )
                  ],
                  annotations: [
                    GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.8,
                      widget: Text(
                        "${value.toStringAsFixed(2)} $unit",
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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