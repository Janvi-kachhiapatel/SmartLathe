// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class UsersScreen extends StatefulWidget {
//   const UsersScreen({super.key});

//   @override
//   State<UsersScreen> createState() => _UsersScreenState();
// }

// class _UsersScreenState extends State<UsersScreen> {

//   List users = [];
//   final usernameController =
//     TextEditingController();

//     final emailController =
//     TextEditingController();

// final passwordController =
//     TextEditingController();

//     Future<void> showCreateUserDialog() async {

//   String role = "operator";

//   showDialog(
//     context: context,

//     builder: (_) => AlertDialog(

//       title: const Text(
//         "Create User",
//       ),

//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [

//           TextField(
//             controller: usernameController,
//             decoration: const InputDecoration(
//               labelText: "Username",
//             ),
//           ),
//           TextField(
//   controller: emailController,
//   decoration: const InputDecoration(
//     labelText: "Email",
//   ),
// ),
//           TextField(
//             controller: passwordController,
//             decoration: const InputDecoration(
//               labelText: "Password",
//             ),
//           ),

//           DropdownButton<String>(
//             value: role,

//             items: const [
//               DropdownMenuItem(
//                 value: "operator",
//                 child: Text("Operator"),
//               ),
//               DropdownMenuItem(
//                 value: "administrator",
//                 child: Text("Administrator"),
//               ),
//             ],

//             onChanged: (value) {
//               role = value!;
//             },
//           ),
//         ],
//       ),

//       actions: [

//         TextButton(
//           onPressed: () async {

//             await Dio().post(
//               "http://10.10.14.121:8001/create_user",
//               data: {
//                 "username":
//                     usernameController.text,
//                     "email": emailController.text,
//                 "password":
//                     passwordController.text,
//                 "role": role,
//               },
//             );

//             Navigator.pop(context);

//             loadUsers();
//           },

//           child: const Text("Create"),
//         ),
//       ],
//     ),
//   );
// }

//   @override
//   void initState() {
//     super.initState();
//     loadUsers();
//   }

//   Future<void> loadUsers() async {

//     final response = await Dio().get(
//       "http://10.10.14.121:8001/users",
//     );

//     setState(() {
//       users = response.data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//   title: const Text("User Management"),

//   actions: [

//     IconButton(
//       icon: const Icon(Icons.add),

//       onPressed: () {
//         showCreateUserDialog();
//       },
//     ),
//   ],
// ),

//       body: ListView.builder(
//         itemCount: users.length,

//         itemBuilder: (context, index) {

//           final user = users[index];

//           return ListTile(
//             leading: const Icon(Icons.person),

//             title: Text(
//               user["username"],
//             ),

//             subtitle: Text(
//               user["role"],
//             ),
//           );
          
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List users = [];

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final response = await ApiService.getUsers();

    setState(() {
      users = response;
    });
  }

  Future<void> showCreateUserDialog() async {
    String role = "operator";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Create User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
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
                  "username": usernameController.text,
                  "email": emailController.text,
                  "password": passwordController.text,
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

  Future<void> deleteUser(int userId) async {
    final success = await ApiService.deleteUser(userId);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User deleted")),
      );
      loadUsers(); // refresh from backend
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Delete failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: showCreateUserDialog,
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final userId = user["id"] ?? user["_id"];
          

          return ListTile(
  leading: const Icon(Icons.person),

  title: Text(user["username"]),

  subtitle: Text(user["role"]),

  trailing: IconButton(
    icon: const Icon(
      Icons.delete,
      color: Colors.red,
    ),
    onPressed: () async {
      bool confirm = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Delete User"),
              content: const Text(
                "Delete this user permanently?",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Delete"),
                ),
              ],
            ),
          ) ??
          false;

      if (!confirm) return;

      bool success = await ApiService.deleteUser(user["id"]);

      if (success) {
        loadUsers();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User deleted"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Delete failed"),
          ),
        );
      }
    },
  ),

            // trailing: IconButton(
            //   icon: const Icon(Icons.delete, color: Colors.red),
            //   onPressed: () async {
            //     final confirm = await showDialog(
            //       context: context,
            //       builder: (_) => AlertDialog(
            //         title: const Text("Delete User"),
            //         content: const Text(
            //             "Are you sure you want to delete this user?"),
            //         actions: [
            //           TextButton(
            //             onPressed: () => Navigator.pop(context, false),
            //             child: const Text("Cancel"),
            //           ),
            //           TextButton(
            //             onPressed: () => Navigator.pop(context, true),
            //             child: const Text("Delete"),
            //           ),
            //         ],
            //       ),
            //     );

            //     if (confirm == true) {
            //       await deleteUser(userId);
            //     }
            //   },
            // ),
          );
        },
      ),
    );
  }
}