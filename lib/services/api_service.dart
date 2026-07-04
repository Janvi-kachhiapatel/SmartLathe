import 'dart:convert';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class ApiService {
  // static const String baseUrl = "http://192.168.56.1:8000";
  static const String baseUrl = "http://10.10.14.121:8001";

  static final Dio dio = Dio();

  static Future<Map<String, dynamic>> getData() async {
    try {
      print("CALLING API: $baseUrl/all");

      final response = await dio.get("$baseUrl/all");

      print("STATUS CODE = ${response.statusCode}");
      print("RESPONSE DATA = ${response.data}");

      return Map<String, dynamic>.from(response.data);
    } catch (e) {
      print("FULL API ERROR = $e");
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getDroData() async {
    try {
      print("CALLING DRO API: $baseUrl/dro");

      final response = await dio.get("$baseUrl/dro");

      print("DRO DATA = ${response.data}");

      return Map<String, dynamic>.from(response.data);
    } catch (e) {
      print("DRO API ERROR = $e");
      rethrow;
    }
  }

// static Future<List<double>> getRpmHistory() async {
//   final response =
//       await http.get(Uri.parse("$baseUrl/history/rpm"));

//   final data = jsonDecode(response.body);

//   return List<double>.from(
//     data["rpm"].map((e) => e.toDouble()),
//   );
// }

static Future<List<double>> getRpmHistory(int limit) async {
  final response =
      await http.get(
        Uri.parse(
          "$baseUrl/history/rpm?limit=$limit",
        ),
      );

  final data = jsonDecode(response.body);

  return List<double>.from(
    data["rpm"].map(
      (e) => (e as num).toDouble(),
    ),
  );
}

// static Future<List<double>> getTemperatureHistory() async {
//   final response =
//       await http.get(Uri.parse("$baseUrl/history/temperature"));

//   final data = jsonDecode(response.body);

//   return List<double>.from(
//     data["temperature"].map((e) => e.toDouble()),
//   );
// }

static Future<List<double>> getTemperatureHistory(int limit) async {
  final response =
      await http.get(
        Uri.parse(
          "$baseUrl/history/temperature?limit=$limit",
        ),
      );

  final data = jsonDecode(response.body);

  return List<double>.from(
    data["temperature"].map(
      (e) => (e as num).toDouble(),
    ),
  );
}



// static Future<List<double>> getVibrationHistory() async {
//   final response =
//       await http.get(Uri.parse("$baseUrl/history/vibration"));

//   final data = jsonDecode(response.body);

//   return List<double>.from(
//     data["vibration"].map((e) => e.toDouble()),
//   );
// }


static Future<List<double>> getPowerHistory(
  int limit,
) async {

  final response = await http.get(
    Uri.parse(
      "$baseUrl/history/power?limit=$limit",
    ),
  );

  final data = jsonDecode(response.body);

  return List<double>.from(
    data["power"].map(
      (e) => (e as num).toDouble(),
    ),
  );
}

static Future<List<dynamic>> getAlarms() async {

  final response = await http.get(
    Uri.parse("$baseUrl/alarms"),
  );

  return jsonDecode(response.body);
}

static Future<List<double>> getVibrationHistory(int limit) async {
  final response =
      await http.get(
        Uri.parse(
          "$baseUrl/history/vibration?limit=$limit",
        ),
      );

  final data = jsonDecode(response.body);

  return List<double>.from(
    data["vibration"].map(
      (e) => (e as num).toDouble(),
    ),
  );
}



static Future<void> zeroX() async {
  print("ZERO X CALLED");

  final response = await http.post(
    Uri.parse("$baseUrl/zero_x"),
  );

  print(response.statusCode);
  print(response.body);
}

static Future<void> zeroY() async {
  await http.post(
    Uri.parse("$baseUrl/zero_y"),
  );
}

static Future<void> zeroBoth() async {
  await http.post(
    Uri.parse("$baseUrl/zero_both"),
  );
}

static Future<void> resetAll() async {
  await http.post(
    Uri.parse("$baseUrl/reset_all"),
  );
}
static Future<List<dynamic>> getUsers() async {
  final response = await http.get(
    Uri.parse("$baseUrl/users"),
  );

  return jsonDecode(response.body);
}
static Future<bool> deleteUser(int userId) async {
  final response = await http.delete(
    Uri.parse("$baseUrl/users/$userId"),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["success"] == true;
  }

  return false;
}
static Future<bool> updateUser(String userId, Map<String, dynamic> data) async {
  final response = await http.put(
    Uri.parse("$baseUrl/users/$userId"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(data),
  );

  return response.statusCode == 200;
}
}


