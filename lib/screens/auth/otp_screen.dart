// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import '../login/login_screen.dart';

// class OtpScreen extends StatefulWidget {

//   final String email;

//   const OtpScreen({
//     super.key,
//     required this.email,
//   });

//   @override
//   State<OtpScreen> createState() =>
//       _OtpScreenState();
// }

// class _OtpScreenState
//     extends State<OtpScreen> {

//   final otpController =
//       TextEditingController();

//   Future<void> verifyOtp() async {

//     try {

//       final response = await Dio().post(
//         "http://10.10.14.121:8001/verify_otp",
//         data: {
//           "email": widget.email,
//           "otp": otpController.text,
//         },
//       );

//       if (response.data["success"] ==
//           true) {

//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (_) =>
//                 const LoginScreen(),
//           ),
//           (route) => false,
//         );
//       }

//     } catch (e) {

//       ScaffoldMessenger.of(context)
//           .showSnackBar(
//         SnackBar(
//           content: Text("$e"),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title:
//             const Text("Verify OTP"),
//       ),

//       body: Padding(
//         padding:
//             const EdgeInsets.all(20),

//         child: Column(
//           children: [

//             TextField(
//               controller:
//                   otpController,
//               decoration:
//                   const InputDecoration(
//                 labelText:
//                     "Enter OTP",
//               ),
//             ),

//             ElevatedButton(
//               onPressed: verifyOtp,
//               child:
//                   const Text("Verify"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:smart_lathe_frontend/screens/login/login_screen.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  Future<void> verifyOtp() async {
    try {
      final response = await Dio().post(
        "http://10.10.14.121:8001/verify_otp",
        data: {
          "email": widget.email,
          "otp": otpController.text,
        },
      );

      if (response.data["success"] == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid OTP"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
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
        title: const Text("Verify OTP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "OTP sent to ${widget.email}",
            ),

            const SizedBox(height: 20),

            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: "Enter OTP",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: verifyOtp,
              child: const Text("VERIFY"),
            ),
          ],
        ),
      ),
    );
  }
}