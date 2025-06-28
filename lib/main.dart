import 'package:flutter/material.dart';
import 'package:task_manager_api/scrren/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_api/scrren/onboarding/loginScreen.dart';
import 'package:task_manager_api/scrren/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_api/scrren/onboarding/registration_screen.dart';
import 'package:task_manager_api/scrren/onboarding/setPasswordScreen.dart';
import 'package:task_manager_api/scrren/onboarding/splash_screen.dart';

void main () {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TaskManager",
      initialRoute: "/pinVerificationScreen",
      routes: {
        "/" : (context)=> SplashScreen(),
        "/setPasswordScreen" : (context)=>setPasswordScreen(),
        "/registrationScreen" : (context)=>RegistrationScreen(),
        "/pinVerificationScreen" : (context)=>PinverificationScreen(),
        "/loginScreen" : (context)=>Loginscreen(),
        "/emailVerificationScreen" :(context)=>Emailverificationscreen()
      },
    );
  }
}
