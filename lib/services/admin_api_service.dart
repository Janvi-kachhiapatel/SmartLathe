import 'package:dio/dio.dart';

class AdminApiService {

  static const String baseUrl =
      "http://10.10.14.121:8001";

  static final Dio dio = Dio();

  static Future<List<dynamic>>
      getUsers() async {

    final response =
        await dio.get("$baseUrl/users");

    return response.data;
  }

  static Future<List<dynamic>>
      getLoginHistory() async {

    final response =
        await dio.get(
      "$baseUrl/login_history",
    );

    return response.data;
  }
// static Future<void> disableUser(
//   int id,
// ) async {

//   await dio.put(
//     "$baseUrl/users/$id/disable",
//   );
// }
static Future<void> disableUser(
  int id,
) async {
  await dio.put(
    "$baseUrl/users/$id/disable",
  );
}

static Future<void> enableUser(
  int id,
) async {
  await dio.put(
    "$baseUrl/users/$id/enable",
  );
}
// static Future<void> enableUser(
//   int id,
// ) async {

//   await dio.put(
//     "$baseUrl/users/$id/enable",
//   );
// }
static Future<List<dynamic>>
getDatabaseRecords() async {

  final response =
      await dio.get(
    "$baseUrl/database_records",
  );

  return response.data;
}

static Future<void> deleteUser(
  int id,
) async {

  await dio.delete(
    "$baseUrl/users/$id",
  );
}
static Future<void> createUser({
  required String username,
  required String password,
  required String role,
}) async {

  await dio.post(
    "$baseUrl/create_user",
    data: {
      "username": username,
      "password": password,
      "role": role,
    },
  );
}
  // static Future<void> deleteUser(
  //     int userId) async {

  //   await dio.delete(
  //     "$baseUrl/users/$userId",
  //   );
  // }
}