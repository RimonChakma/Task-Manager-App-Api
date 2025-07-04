import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserData(Map<String, dynamic> userData) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString("token", userData["token"] ?? "");
  await prefs.setString("email", userData["data"]?["email"] ?? "");
  await prefs.setString("firstName", userData["data"]?["firstName"] ?? "");
  await prefs.setString("lastName", userData["data"]?["lastName"] ?? "");
  await prefs.setString("phone", userData["data"]?["phone"] ?? "");
  await prefs.setString("password", userData["data"]?["password"] ?? "");
  await prefs.setString("conformPassword", userData["data"]?["conformPassword"] ?? "");
}

Future<String?> readUserData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> writeEmailVerification(String email) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("emailVerification", email);
}

Future<void> writeOTPVerification(String otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("otp", otp);
}

Future<String?> readData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}
