import 'package:shared_preferences/shared_preferences.dart';

  writeUserData (userData) async {
  final prefer = await SharedPreferences.getInstance();

  await prefer.setString("token", userData["token"]);
  await prefer.setString("email", userData["data"]["email"]);
  await prefer.setString("firstName", userData["data"]["firstName"]);
  await prefer.setString("lastName", userData["data"]["lastName"]);
  await prefer.setString("phone", userData["data"]["phone"]);
  await prefer.setString("password", userData["data"]["password"]);
  await prefer.setString("conformPassword", userData["data"]["conformPassword"]);
}

readUserData (key) async {
    final prefer = await SharedPreferences.getInstance();
    String? myData = prefer.getString(key);
    return myData;
}

writeEmailVerification (Email) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setString("emailVerification",Email);
}

writeOTPVerification (OTP) async {
    final prefer = await SharedPreferences.getInstance();
    await prefer.setString("otp",  OTP);
}

readData (Key) async {
    final prefer = await SharedPreferences.getInstance();
    String? data = await prefer.getString(Key);
    return data;
}

