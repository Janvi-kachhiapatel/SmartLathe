import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/screens/login/login_screen.dart';
import 'package:smart_lathe_frontend/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lathe_frontend/screens/users/users_screen.dart';
import 'package:smart_lathe_frontend/screens/history/login_history_screen.dart';
import 'package:smart_lathe_frontend/screens/history/login_history_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsEnabled = true;
  String selectedTheme = "Light";

    String username = "";
  String role = "";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("username") ?? "";
      role = prefs.getString("role") ?? "";
    });
  }

  
  Widget settingTile({
    required IconData icon,
    required String title,
    String? value,
    VoidCallback? onTap,
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? Colors.black54),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null)
                Text(
                  value,
                  style: const TextStyle(color: Colors.grey),
                ),
              const SizedBox(width: 8),
              const Icon(Icons.chevron_right),
            ],
          ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile & Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Divider(height: 1),
  //           
            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children:  [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username.isEmpty ? "Unknown User" : username,
                            style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          role.isEmpty ? "No Role" : role,
                            style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Settings Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  
                  settingTile(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    trailing: Switch(
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationsEnabled = value;
                        });
                      },
                    ),
                  ),

                  if (role == "administrator")
                  settingTile(
                    icon: Icons.people,
                    title: "User Management",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UsersScreen(),
                        ),
                      );
                    },
                  ),

                  if (role == "administrator")
settingTile(
  icon: Icons.history,
  title: "Login History",
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const LoginHistoryScreen(),
            
      ),
    );
  },
),


                  const Divider(height: 1),

                  settingTile(
                  icon: Icons.logout,
                  title: "Log Out",
                  textColor: Colors.red,
                  onTap: () async {

  final prefs =
      await SharedPreferences.getInstance();

  await prefs.clear();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => const LoginScreen(),
    ),
    (route) => false,
  );
},
                ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "App Version 1.0.0",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}