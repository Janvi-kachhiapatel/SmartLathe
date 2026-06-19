import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'package:smart_lathe_frontend/services/admin_api_service.dart';
import 'package:smart_lathe_frontend/screens/history/history_screen.dart';
import 'user_management_screen.dart';
import 'database_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() =>
      _AdminDashboardState();
}

class _AdminDashboardState
    extends State<AdminDashboard> {

  Map<String, dynamic> machineData = {};

  List users = [];

  List loginHistory = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {

    try {

      final machine =
          await ApiService.getData();

      final userList =
          await AdminApiService.getUsers();

      final history =
          await AdminApiService.getLoginHistory();

      setState(() {

        machineData = machine;

        users = userList;

        loginHistory = history;

        loading = false;
      });

    } catch (e) {

      print(e);
    }
  }

  Widget sectionTitle(String text) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {

      return const Scaffold(
        body: Center(
          child:
              CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
        ),
      ),

      body: RefreshIndicator(

        onRefresh: loadData,

        child: ListView(

          padding:
              const EdgeInsets.all(16),

          children: [

            Row(
              children: [

                Expanded(
                  child: Card(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              16),
                      child: Column(
                        children: [

                          const Icon(
                            Icons.people,
                            size: 40,
                            color: Colors.blue,
                          ),

                          Text(
                            users.length
                                .toString(),
                            style:
                                const TextStyle(
                              fontSize: 28,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const Text(
                            "Total Users",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                              16),
                      child: Column(
                        children: [

                          Icon(
                            machineData[
                                        "machine_status"] ==
                                    "ON"
                                ? Icons
                                    .check_circle
                                : Icons.cancel,
                            color:
                                machineData[
                                            "machine_status"] ==
                                        "ON"
                                    ? Colors.green
                                    : Colors.red,
                            size: 40,
                          ),

                          Text(
                            machineData[
                                    "machine_status"] ??
                                "OFF",
                            style:
                                const TextStyle(
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const Text(
                            "Machine",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            sectionTitle(
              "Machine Status",
            ),

            Card(
              child: Column(
                children: [

                  ListTile(
                    title:
                        const Text("RPM"),
                    trailing: Text(
                      "${machineData["rpm"]}",
                    ),
                  ),

                  ListTile(
                    title: const Text(
                        "Chuck"),
                    trailing: Text(
                      machineData[
                                  "chuck_key_status"] ==
                              1
                          ? "CLOSED"
                          : "OPEN",
                    ),
                  ),

                  ListTile(
                    title: const Text(
                        "Buzzer"),
                    trailing: Text(
                      machineData[
                                  "red_buzzer"] ==
                              1
                          ? "ON"
                          : "OFF",
                    ),
                  ),
                ],
              ),
            ),

            sectionTitle(
              "Position",
            ),

            Card(
              child: Column(
                children: [

                  ListTile(
                    title: const Text(
                        "X Position"),
                    trailing: Text(
                      "${machineData["x_position"]}",
                    ),
                  ),

                  ListTile(
                    title: const Text(
                        "Y Position"),
                    trailing: Text(
                      "${machineData["y_position"]}",
                    ),
                  ),

                  ListTile(
                    title: const Text(
                        "Depth Of Cutting"),
                    trailing: Text(
                      "${machineData["depth_of_cutting"]}",
                    ),
                  ),

                  ListTile(
                    title: const Text(
                        "Cutting Speed"),
                    trailing: Text(
                      "${machineData["cutting_speed"]}",
                    ),
                  ),
                ],
              ),
            ),

            sectionTitle(
              "Quick Actions",
            ),

            Wrap(
              spacing: 10,

              children: [

                ElevatedButton.icon(
  icon: const Icon(
    Icons.storage,
  ),

  label: const Text(
    "Database",
  ),

  onPressed: () {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const DatabaseScreen(),
      ),
    );
  },
),

                ElevatedButton.icon(
                  icon: const Icon(
                      Icons.people),
                  label: const Text(
                      "Users"),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const UserManagementScreen(),
                      ),
                    );
                  },
                ),

                ElevatedButton.icon(
                  icon: const Icon(
                      Icons.history),
                  label: const Text(
                      "History"),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const HistoryScreen(),
                      ),
                    );
                  },
                ),

                ElevatedButton.icon(
                  icon: const Icon(
                      Icons.refresh),
                  label: const Text(
                      "Refresh"),
                  onPressed: loadData,
                ),
              ],
            ),

            sectionTitle(
              "Recent Logins",
            ),

            Card(
              child: Column(
                children:
                    loginHistory.take(5).map(
                  (log) {

                    return ListTile(
                      title: Text(
                        log["username"],
                      ),

                      subtitle: Text(
                        log["login_time"],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}