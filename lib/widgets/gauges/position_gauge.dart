import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';

class PositionGauge extends StatelessWidget {
  final double xValue;
  final double yValue;
  final double cuttingSpeed;
  final double depthOfCutting;

  const PositionGauge({
  super.key,
  required this.xValue,
  required this.yValue,
  required this.cuttingSpeed,
  required this.depthOfCutting,
});

  Widget buildGauge(
    String title,
    double value,
    Color color,
    double min,
    double max,
  ) {
    return
    Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 8),

          // SizedBox(
          //   height: 50,
          //   child: SfRadialGauge(
          //     axes: [
          //       RadialAxis(
          //         minimum: min,
          //         maximum: max,
          //         startAngle: 180,
          //         endAngle: 0,

          //         showTicks: false,
          //         showLabels: false,

          //         axisLineStyle: const AxisLineStyle(
          //           thickness: 12,
          //         ),

  //                 pointers: [
  //                   // NeedlePointer(
  //                   //   value: value.clamp(min, max),
  //                   //   needleColor: color,
  //                   //   needleLength: 0.5,
  //                   NeedlePointer(
  // value: value.clamp(min, max),
  // needleColor: color,

  // needleLength: 0.38,

  // needleStartWidth: 1,
  // needleEndWidth: 2,
  //                     knobStyle: KnobStyle(
  //                       color: color,
  //                       knobRadius: 0.03,
  //                     ),
  //                   ),
  //                 ],

  Column(
  children: [

Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  ),
  decoration: BoxDecoration(
    color: color.withOpacity(0.1),
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text(
    value.toStringAsFixed(3),
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  ),
),

  //   const SizedBox(height: 4),

  //   FittedBox(
  // fit: BoxFit.scaleDown,
  // child: Text(
  //   value.toStringAsFixed(3),
  //   style: TextStyle(
  //     fontSize: 18,
  //       fontWeight: FontWeight.bold,
  //       color: color,
  //     ),
  //   ),
  //   ),
  ],
),
      

                  //annotations: [
                    // GaugeAnnotation(
                    //   angle: 90,
                    //   positionFactor: 0.15,
                    //   widget: Text(
                    //     value.toStringAsFixed(3),
                    //     style: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //       color: color,
                    //     ),
                    //   ),
                    // ),
                  //],
                  

          const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Text(
            "LATHE POSITION",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 20),

         SizedBox(
  height: 150,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      buildGauge(
        "X Axis",
        xValue,
        Colors.orange,
        -100,
        100,
      ),

      const SizedBox(width: 10),

      buildGauge(
        "Y Axis",
        yValue,
        Colors.blue,
        -100,
        100,
      ),
    ],
  ),
),

const SizedBox(height: 0),

Row(
  children: [
    Expanded(
      child: Text(
        "Cutting Speed",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    ),

    const SizedBox(width: 4),

    FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        cuttingSpeed.toStringAsFixed(2),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

const SizedBox(height: 4),

Row(
  children: [
    Expanded(
      child: Text(
        "Depth Of Cutting",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    ),

    const SizedBox(width: 4),

    FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        depthOfCutting.toStringAsFixed(2),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),
        ],
      ),
    );
  }
}