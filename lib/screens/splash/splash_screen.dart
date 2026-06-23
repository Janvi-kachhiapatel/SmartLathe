// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_lathe_frontend/screens/login/login_screen.dart';
// import 'package:smart_lathe_frontend/screens/home/main_navigation.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     super.initState();
//     checkLogin();
//   }

//   Future<void> checkLogin() async {

//     await Future.delayed(
//       const Duration(seconds: 3),
//     );

//     final prefs =
//         await SharedPreferences.getInstance();

//     final username =
//         prefs.getString("username");

//     if (!mounted) return;

//     if (username != null) {

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const MainNavigation(),
//         ),
//       );

//     } else {

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const LoginScreen(),
//         ),
//       );
//     }
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/bg.webp'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         color: Colors.black.withOpacity(0.5),
//         child: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.precision_manufacturing,
//                 color: Colors.white,
//                 size: 100,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'SMART LATHE',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Machine Monitoring System',
//                 style: TextStyle(
//                   color: Colors.white70,
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 40),
//               CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lathe_frontend/screens/login/login_screen.dart';
import 'package:smart_lathe_frontend/screens/home/main_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 4));

    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("username");

    if (!mounted) return;

    if (username != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black54,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.precision_manufacturing,
                  size: 100,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  'SMART LATHE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Machine Monitoring System',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 40),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}