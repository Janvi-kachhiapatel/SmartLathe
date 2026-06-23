import 'package:flutter/material.dart';
import 'package:smart_lathe_frontend/core/app_theme.dart';
import 'package:smart_lathe_frontend/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_lathe_frontend/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'providers/dashboard_provider.dart';
import 'providers/vibit_provider.dart';
import 'providers/energy_provider.dart';
import 'providers/alarm_provider.dart';
import 'providers/machining_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Firebase.initializeApp();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  final prefs =
      await SharedPreferences.getInstance();

  final username =
      prefs.getString("username");

  runApp(
  MultiProvider(
    providers: [

      ChangeNotifierProvider(
        create: (_) => DashboardProvider(),
      ),

      ChangeNotifierProvider(
        create: (_) => VibitProvider(),
      ),

      ChangeNotifierProvider(
        create: (_) => EnergyProvider(),
      ),

      ChangeNotifierProvider(
        create: (_) => AlarmProvider(),
      ),

      ChangeNotifierProvider(
        create: (_) => MachiningProvider(),
      ),

    ],
    child: SmartLatheApp(
      isLoggedIn: username != null,
    ),
  ),
);
}

class SmartLatheApp extends StatefulWidget {

  final bool isLoggedIn;

  const SmartLatheApp({
    super.key,
    required this.isLoggedIn,
  });

  static _SmartLatheAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_SmartLatheAppState>();
  }

  @override
  State<SmartLatheApp> createState() => _SmartLatheAppState();
}

class _SmartLatheAppState extends State<SmartLatheApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(bool dark) {
    setState(() {
      themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
 return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Smart Lathe Monitoring',

  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,

  themeMode: themeMode,

 home: const SplashScreen(),
);
  }
}