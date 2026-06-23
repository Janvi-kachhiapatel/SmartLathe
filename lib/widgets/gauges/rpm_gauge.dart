import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class RpmGauge extends StatelessWidget {
  final double rpm;

  const RpmGauge({
    super.key,
    required this.rpm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Text(
            "LIVE RPM",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: 3000,
                  startAngle: 180,
                  endAngle: 0,
                  ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: 1500,
                      color: Colors.orange,
                    ),
                    GaugeRange(
                      startValue: 1500,
                      endValue: 3000,
                      color: Colors.blue,
                    ),
                  ],
                  pointers: [
                    NeedlePointer(value: rpm),
                  ],
                  annotations: [
                    GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.8,
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            rpm.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("RPM"),
                        ],
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