import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  List users = [];
  final usernameController =
    TextEditingController();

    final emailController =
    TextEditingController();

final passwordController =
    TextEditingController();

    Future<void> showCreateUserDialog() async {

  String role = "operator";

  showDialog(
    context: context,

    builder: (_) => AlertDialog(

      title: const Text(
        "Create User",
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
          ),
          TextField(
  controller: emailController,
  decoration: const InputDecoration(
    labelText: "Email",
  ),
),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),

          DropdownButton<String>(
            value: role,

            items: const [
              DropdownMenuItem(
                value: "operator",
                child: Text("Operator"),
              ),
              DropdownMenuItem(
                value: "administrator",
                child: Text("Administrator"),
              ),
            ],

            onChanged: (value) {
              role = value!;
            },
          ),
        ],
      ),

      actions: [

        TextButton(
          onPressed: () async {

            await Dio().post(
              "http://10.10.14.121:8001/create_user",
              data: {
                "username":
                    usernameController.text,
                    "email": emailController.text,
                "password":
                    passwordController.text,
                "role": role,
              },
            );

            Navigator.pop(context);

            loadUsers();
          },

          child: const Text("Create"),
        ),
      ],
    ),
  );
}

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {

    final response = await Dio().get(
      "http://10.10.14.121:8001/users",
    );

    setState(() {
      users = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
  title: const Text("User Management"),

  actions: [

    IconButton(
      icon: const Icon(Icons.add),

      onPressed: () {
        showCreateUserDialog();
      },
    ),
  ],
),

      body: ListView.builder(
        itemCount: users.length,

        itemBuilder: (context, index) {

          final user = users[index];

          return ListTile(
            leading: const Icon(Icons.person),

            title: Text(
              user["username"],
            ),

            subtitle: Text(
              user["role"],
            ),
          );
        },
      ),
    );
  }
}