import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_colors.dart';
import 'package:smart_lathe_frontend/screens/home/main_navigation.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lathe_frontend/screens/auth/register_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = false;

  Future<void> googleLogin() async {

  try {
      print("STEP 1");
    final GoogleSignIn googleSignIn =
        GoogleSignIn();
    print("STEP 2");
    final GoogleSignInAccount? user =
        await googleSignIn.signIn();
    print("STEP 3");
    if (user == null) return;


    print("EMAIL = ${user.email}");
    final response = await Dio().post(
      "http://10.10.14.121:8001/google-login",
      data: {
        "email": user.email,
        "name": user.displayName,
      },
    );

    if (response.data["success"]) {

      final prefs =
          await SharedPreferences.getInstance();

      await prefs.setString(
        "username",
        response.data["username"],
      );

      await prefs.setString(
        "role",
        response.data["role"],
      );
      print("ROLE = ${response.data["role"]}");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const MainNavigation(),
        ),
      );
    }

  } catch (e) {

    print(e);
  }
}

  Future<void> login() async {
  try {
    final response = await Dio().post(
      "http://10.10.14.121:8001/login",
      data: {
        "username": usernameController.text,
        "password": passwordController.text,
      },
    );

    if (response.data["success"] == true) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        "username",
        response.data["username"],
      );

      await prefs.setString(
        "role",
        response.data["role"],
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Username or Password"),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Login Error: $e"),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.precision_manufacturing,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "SMART LATHE",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Industrial IoT Monitoring System",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textGrey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login to continue",
                      style: TextStyle(
                        color: AppColors.textGrey,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            "Remember Me",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Forgot Password"),
                              content: const Text(
                                "Please contact administrator to reset your password.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    onPressed: login,
    child: const Text(
      "LOGIN",
      style: TextStyle(
        fontSize: 16,
      ),
    ),

  ),
),

const SizedBox(height: 10),

ElevatedButton.icon(
  onPressed: googleLogin,
  icon: const Icon(Icons.login),
  label: const Text(
    "Sign In With Google",
  ),
),

const SizedBox(height: 10),



                  const SizedBox(height: 20),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.security,
                        size: 18,
                        color: AppColors.textGrey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Secured Connection",
                        style: TextStyle(
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}