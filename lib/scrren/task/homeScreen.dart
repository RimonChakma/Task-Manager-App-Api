import 'package:flutter/material.dart';
import 'package:task_manager_api/component/appBottomNav.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  int bottomTabItem = 1;

  onTabItem (int index) {
    setState(() {
      bottomTabItem;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      bottomNavigationBar: appBottomNav(bottomTabItem,onTabItem),

    );
  }
}
