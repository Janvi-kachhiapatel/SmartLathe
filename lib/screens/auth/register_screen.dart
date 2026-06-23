import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {

  final usernameController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  String role = "operator";

  Future<void> register() async {

    try {

      final response = await Dio().post(
        "http://10.10.14.121:8001/register",
        data: {
          "username":
              usernameController.text,

          "email":
              emailController.text,

          "password":
              passwordController.text,

          "role": role,
        },
      );

      if (response.data["success"] == true) {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(
              email:
                  emailController.text,
            ),
          ),
        );
      }

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text("$e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
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
                  emailController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Email",
              ),
            ),

            TextField(
              controller:
                  passwordController,
              obscureText: true,
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
                  child:
                      Text("Operator"),
                ),

                DropdownMenuItem(
                  value: "supervisor",
                  child:
                      Text("Supervisor"),
                ),

              ],
              onChanged: (value) {

                setState(() {
                  role = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: register,
              child:
                  const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}