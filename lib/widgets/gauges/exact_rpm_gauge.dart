import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class ExactRpmGauge extends StatelessWidget {
  final double rpm;

  const ExactRpmGauge({
    super.key,
    required this.rpm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "SPINDLE RPM",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
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

                  showLabels: false,
                  showTicks: false,

                  axisLineStyle: const AxisLineStyle(
                    thickness: 18,
                  ),

                  ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: 1000,
                      color: Colors.green,
                      startWidth: 18,
                      endWidth: 18,
                    ),
                    GaugeRange(
                      startValue: 1000,
                      endValue: 2000,
                      color: Colors.orange,
                      startWidth: 18,
                      endWidth: 18,
                    ),
                    GaugeRange(
                      startValue: 2000,
                      endValue: 3000,
                      color: Colors.red,
                      startWidth: 18,
                      endWidth: 18,
                    ),
                  ],

                  pointers: [
                    // NeedlePointer(
                    //   value: rpm,
                    //   needleLength: 0.5,
                    //   knobStyle: const KnobStyle(
                    //     knobRadius: 0.05,
                    //   ),
                    // )
                    NeedlePointer(
  value: rpm,
  needleLength: 0.45,

  needleStartWidth: 1,
  needleEndWidth: 3,

  knobStyle: const KnobStyle(
    knobRadius: 0.03,
  ),
)
                  ],

                  annotations: [
                    GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.72,
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
                          const Text(
                            "RPM",
                            style: TextStyle(
                              color: AppColors.textGrey,
                            ),
                          ),
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