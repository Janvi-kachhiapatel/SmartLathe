import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/services/admin_api_service.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() =>
      _UserManagementScreenState();
}

class _UserManagementScreenState
    extends State<UserManagementScreen> {

  List users = [];

  bool loading = true;
  final usernameController =
    TextEditingController();

final passwordController =
    TextEditingController();
    void showAddUserDialog() {

  String role = "operator";

  showDialog(
    context: context,

    builder: (context) {

      return AlertDialog(

        title: const Text(
          "Create User",
        ),

        content: StatefulBuilder(
          builder: (context, setDialogState) {

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                TextField(
                  controller:
                      usernameController,

                  decoration:
                      const InputDecoration(
                    labelText:
                        "Username",
                  ),
                ),

                TextField(
                  controller:
                      passwordController,

                  decoration:
                      const InputDecoration(
                    labelText:
                        "Password",
                  ),
                ),

                DropdownButton<String>(
                  value: role,

                  items: const [

                    DropdownMenuItem(
                      value: "operator",
                      child: Text(
                        "Operator",
                      ),
                    ),

                    DropdownMenuItem(
                      value:
                          "administrator",
                      child: Text(
                        "Administrator",
                      ),
                    ),
                  ],

                  onChanged: (value) {

                    setDialogState(() {
                      role = value!;
                    });
                  },
                ),
              ],
            );
          },
        ),

        actions: [

          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {

              await AdminApiService
                  .createUser(
                username:
                    usernameController.text,

                password:
                    passwordController.text,

                role: role,
              );

              Navigator.pop(context);

              loadUsers();
            },

            child: const Text("Create"),
          ),
        ],
      );
    },
  );
}

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {

    try {

      final data =
          await AdminApiService.getUsers();

      setState(() {
        users = data;
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
  title: const Text("User Management"),

  actions: [
    IconButton(
      icon: const Icon(Icons.person_add),
      onPressed: () {
        showAddUserDialog();
      },
    ),
  ],

      ),

      body: loading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,

              itemBuilder:
                  (context, index) {

                final user = users[index];

                return Card(
                  margin:
                      const EdgeInsets.all(10),

                  child: ListTile(

                    title: Text(
                      user["username"],
                    ),

                    subtitle: Text(
                      "Role: ${user["role"]}",
                    ),

                    trailing: Row(
                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        IconButton(
  icon: Icon(
    user["active"]
        ? Icons.lock_open
        : Icons.lock,
  ),

  onPressed: () async {

    if (user["active"]) {

      await AdminApiService
          .disableUser(
        user["id"],
      );

    } else {

      await AdminApiService
          .enableUser(
        user["id"],
      );
    }

    loadUsers();
  },
),

                        const SizedBox(width: 10),

                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),

                          onPressed: () async {

                            await AdminApiService
                                .deleteUser(
                              user["id"],
                            );

                            loadUsers();
                          },
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