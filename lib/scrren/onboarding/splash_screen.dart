import 'package:flutter/material.dart';
import 'package:task_manager_api/style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          padding: EdgeInsets.all(30),
          child: Center(child: Image.asset("assets/images/logo.png",alignment: Alignment.center,height: 200,width: 200,)),)
      ],),
    );
  }
}
