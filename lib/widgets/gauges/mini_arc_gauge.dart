import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MiniArcGauge extends StatelessWidget {
  final String title;
  final double value;
  final double max;
  final Color color;

  const MiniArcGauge({
    super.key,
    required this.title,
    required this.value,
    required this.max,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),

          SizedBox(
            height: 80,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: max,
                  startAngle: 180,
                  endAngle: 0,
                  showLabels: false,
                  showTicks: false,
                  radiusFactor: 0.95,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.12,
                    thicknessUnit: GaugeSizeUnit.factor,
                    color: color.withOpacity(0.18),
                  ),
                  pointers: [
                    RangePointer(
                      value: value,
                      width: 0.12,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: color,
                    ),
                  ],
                  annotations: [
                    GaugeAnnotation(
                      angle: 90,
                      positionFactor: 0.2,
                      widget: Text(
                        value.toStringAsFixed(1),
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}