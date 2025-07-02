import 'package:flutter/material.dart';
import 'package:task_manager_api/scrren/onboarding/emailVerificationScreen.dart';
import 'package:task_manager_api/scrren/onboarding/loginScreen.dart';
import 'package:task_manager_api/scrren/onboarding/pinVerificationScreen.dart';
import 'package:task_manager_api/scrren/onboarding/registration_screen.dart';
import 'package:task_manager_api/scrren/onboarding/setPasswordScreen.dart';
import 'package:task_manager_api/scrren/onboarding/splash_screen.dart';
import 'package:task_manager_api/scrren/task/taskCreateScreen.dart';
import 'package:task_manager_api/utility/utility.dart';

void main () async {

  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData("token");

  if(token == null){
    runApp(MyApp("/loginScreen"));
  }else{
    runApp(MyApp("/newTaskScreen"));
  }
}
class MyApp extends StatelessWidget {

  final String token;
  MyApp(this.token);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TaskManager",
      initialRoute: token,
      routes: {
        "/setPasswordScreen" : (context)=>setPasswordScreen(),
        "/registrationScreen" : (context)=>RegistrationScreen(),
        "/pinVerificationScreen" : (context)=>PinverificationScreen(),
        "/loginScreen" : (context)=>Loginscreen(),
        "/emailVerificationScreen" :(context)=>Emailverificationscreen(),
        "/newTaskScreen" :(context)=>NewTaskScreen()
      },
    );
  }
}
