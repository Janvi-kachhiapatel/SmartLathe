import 'package:flutter/material.dart';

class LiveMachineCard extends StatelessWidget {

  final Map<String, dynamic> data;

  const LiveMachineCard({
    super.key,
    required this.data,
  });

  double value(String key) {

    if (!data.containsKey(key)) {
      return 0;
    }

    return double.tryParse(
          data[key].toString(),
        ) ??
        0;
  }

  Widget machineTile(
    IconData icon,
    Color color,
    String title,
    String value,
    String unit,
  ) {

    return Container(

      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.grey.shade50,

        borderRadius:
            BorderRadius.circular(15),

      ),

      child: Row(

        children: [

          CircleAvatar(

            backgroundColor:
                color.withOpacity(.15),

            child: Icon(
              icon,
              color: color,
            ),

          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  "$value $unit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
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

    return Card(

      elevation: 4,

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Row(

              children: const [

                Icon(
                  Icons.memory,
                  color: Colors.green,
                ),

                SizedBox(width: 10),

                Text(
                  "Live Machine Data",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            machineTile(
              Icons.speed,
              Colors.blue,
              "Live RPM",
              value("rpm")
                  .toStringAsFixed(0),
              "RPM",
            ),

            machineTile(
              Icons.linear_scale,
              Colors.orange,
              "Feed Rate",
              value("feed")
                  .toStringAsFixed(2),
              "mm/rev",
            ),

            machineTile(
              Icons.thermostat,
              Colors.red,
              "Temperature",
              value("temperature")
                  .toStringAsFixed(1),
              "°C",
            ),

            machineTile(
              Icons.vibration,
              Colors.deepPurple,
              "Vibration",
              value("vibration")
                  .toStringAsFixed(2),
              "mm/s",
            ),

            machineTile(
              Icons.build,
              Colors.teal,
              "Tool Wear",
              value("toolWear")
                  .toStringAsFixed(0),
              "%",
            ),

            machineTile(
              Icons.timer,
              Colors.green,
              "Machine Runtime",
              value("runtime")
                  .toStringAsFixed(0),
              "min",
            ),
          ],
        ),
      ),
    );
  }
}