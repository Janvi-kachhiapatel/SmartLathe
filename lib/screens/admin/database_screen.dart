import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/services/admin_api_service.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() =>
      _DatabaseScreenState();
}

class _DatabaseScreenState
    extends State<DatabaseScreen> {

  List records = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadRecords();
  }

  Future<void> loadRecords() async {

    try {

      final data =
          await AdminApiService
              .getDatabaseRecords();

      setState(() {
        records = data;
        loading = false;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Database Records"),
      ),

      body: loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : ListView.builder(

              itemCount: records.length,

              itemBuilder:
                  (context, index) {

                final row =
                    records[index];

                return Card(
                  margin:
                      const EdgeInsets.all(8),

                  child: Padding(
                    padding:
                        const EdgeInsets.all(12),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          row["timestamp"]
                              .toString(),
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          "RPM : ${row["rpm"]}",
                        ),

                        Text(
                          "X Position : ${row["x_position"]}",
                        ),

                        Text(
                          "Y Position : ${row["y_position"]}",
                        ),

                        Text(
                          "Cutting Speed : ${row["cutting_speed"]}",
                        ),

                        Text(
                          "Depth Of Cutting : ${row["depth_of_cutting"]}",
                        ),

                        Text(
                          "Machine : ${row["machine_status"]}",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}