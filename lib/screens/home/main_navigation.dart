import 'package:flutter/material.dart';

import 'package:smart_lathe_frontend/screens/dashboard/dashboard_screen.dart';
import 'package:smart_lathe_frontend/screens/vibit1/vibit1_screen.dart';
import 'package:smart_lathe_frontend/screens/vibit2/vibit2_screen.dart';
import 'package:smart_lathe_frontend/screens/energy/energy_screen.dart';
import 'package:smart_lathe_frontend/screens/position/position_screen.dart';
//import 'package:smart_lathe_frontend/screens/machine/machine_screen.dart';
import 'package:smart_lathe_frontend/screens/alarms/alarms_screen.dart';
import 'package:smart_lathe_frontend/screens/history/history_screen.dart';
import 'package:smart_lathe_frontend/screens/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smart_lathe_frontend/screens/admin/admin_dashboard.dart';
import 'package:smart_lathe_frontend/screens/machining/machining_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  String role = "";
  int currentIndex = 0;
  @override
void initState() {
  super.initState();
  loadRole();
}

Future<void> loadRole() async {

  final prefs =
      await SharedPreferences.getInstance();

  setState(() {
    role = prefs.getString("role") ?? "";
  });
}
List<Widget> get screens {

  if (role == "administrator") {

    return const [
      DashboardScreen(),
      MachiningScreen(),
      Vibit1Screen(),
      Vibit2Screen(),
      EnergyScreen(),
      PositionScreen(),
      HistoryScreen(),
      //AdminDashboard(),
      ProfileScreen(),
    ];
  }

  return const [
    DashboardScreen(),
    MachiningScreen(),
    Vibit1Screen(),
    Vibit2Screen(),
    EnergyScreen(),
    PositionScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];
}

List<BottomNavigationBarItem> get items {

  if (role == "administrator") {

    return const [

      BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
  icon: Icon(Icons.precision_manufacturing),
  label: 'Machining',
),

      BottomNavigationBarItem(
        icon: Icon(Icons.memory),
        label: 'VIBIT1',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.memory_outlined),
        label: 'VIBIT2',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.bolt),
        label: 'Energy',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.open_with),
        label: 'Position',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.show_chart),
        label: 'History',
      ),

      // BottomNavigationBarItem(
      //   icon: Icon(Icons.admin_panel_settings),
      //   label: 'Admin',
      // ),

      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }

  return const [

    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.memory),
      label: 'VIBIT1',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.memory_outlined),
      label: 'VIBIT2',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.bolt),
      label: 'Energy',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.open_with),
      label: 'Position',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.show_chart),
      label: 'History',
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 9,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}