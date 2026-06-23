import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginHistoryScreen extends StatefulWidget {
  const LoginHistoryScreen({super.key});

  @override
  State<LoginHistoryScreen> createState() =>
      _LoginHistoryScreenState();
}

class _LoginHistoryScreenState
    extends State<LoginHistoryScreen> {

  List history = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {

    final response = await Dio().get(
      "http://10.10.14.121:8001/login_history",
    );

    setState(() {
      history = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login History",
        ),
      ),

      body: ListView.builder(
        itemCount: history.length,

        itemBuilder: (context, index) {

          final item = history[index];

          return Card(
            child: ListTile(
              title: Text(
                item["username"],
              ),

              subtitle: Text(
                item["login_time"],
              ),

              trailing: Text(
                item["device"],
              ),
            ),
          );
        },
      ),
    );
  }
}