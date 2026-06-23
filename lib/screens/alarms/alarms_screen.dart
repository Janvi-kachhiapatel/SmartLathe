<<<<<<< HEAD
import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {

  Timer? timer;
  Map<String,dynamic> liveData = {};

  @override
  void initState() {
    super.initState();

    loadData();

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => loadData(),
    );
  }

  Future<void> loadData() async {

    try{

      liveData = await ApiService.getData();

      if(mounted){
        setState(() {});
      }

    }catch(e){

      debugPrint(e.toString());

    }

  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double rpm =
        ((liveData["vibit1"]?["rpm"] ?? 0) as num).toDouble();

    double temperature =
        ((liveData["vibit1"]?["temperature"] ?? 0) as num).toDouble();

    double vibration =
        ((liveData["vibit1"]?["z_rms_velocity"] ?? 0) as num).toDouble();

    double power =
        ((liveData["energy"]?["data"]?["total_kW"] ?? 0) as num).toDouble();

    List<Map<String,dynamic>> alarms=[];

    if(rpm>1800){
      alarms.add({
        "title":"High RPM",
        "value":"${rpm.toStringAsFixed(0)} RPM",
        "color":Colors.red
      });
    }

    if(temperature>50){
      alarms.add({
        "title":"High Temperature",
        "value":"${temperature.toStringAsFixed(1)} °C",
        "color":Colors.orange
      });
    }

    if(vibration>2){
      alarms.add({
        "title":"High Vibration",
        "value":"${vibration.toStringAsFixed(2)} mm/s",
        "color":Colors.red
      });
    }

    if(power>5){
      alarms.add({
        "title":"Power Consumption High",
        "value":"${power.toStringAsFixed(2)} kW",
        "color":Colors.deepOrange
      });
    }

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Machine Alarms",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          children: [

            Card(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: alarms.isEmpty
                      ? Colors.green
                      : Colors.red,
                  child: Icon(
                    alarms.isEmpty
                        ? Icons.check
                        : Icons.warning,
                    color: Colors.white,
                  ),
                ),

                title: Text(
                  alarms.isEmpty
                      ? "Machine Healthy"
                      : "${alarms.length} Active Alarms",
                ),

                subtitle: Text(
                  alarms.isEmpty
                      ? "No abnormal condition detected."
                      : "Immediate attention required.",
                ),

              ),

            ),

            const SizedBox(height:20),

            Expanded(

              child: alarms.isEmpty

                  ? const Center(

                      child: Text(
                        "No Active Alarm",
                        style: TextStyle(
                          fontSize:22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    )

                  : ListView.builder(

                      itemCount: alarms.length,

                      itemBuilder:(context,index){

                        final alarm=alarms[index];

                        return Card(

                          margin:
                              const EdgeInsets.only(bottom:15),

                          color:
                              alarm["color"].withOpacity(.08),

                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(18),
                          ),

                          child: ListTile(

                            leading: Icon(
                              Icons.warning_amber,
                              color: alarm["color"],
                              size:35,
                            ),

                            title: Text(
                              alarm["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(alarm["value"]),

                          ),

                        );

                      },

                    ),

            ),

          ],
=======
import 'package:flutter/material.dart';

class AlarmsScreen extends StatelessWidget {

  const AlarmsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Alarms"),
      ),

      body: const Center(

        child: Text(

          "Alarm module coming soon",

          style: TextStyle(fontSize: 20),
>>>>>>> 9c5fb487dc294f720fb3d4a2b3f7be04454fe9ce

        ),

      ),

    );

  }

}