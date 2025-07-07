import 'package:flutter/material.dart';
import 'package:task_manager_api/component/appBottomNav.dart';
import 'package:task_manager_api/component/canceledTaskList.dart';
import 'package:task_manager_api/component/completeTask.dart';
import 'package:task_manager_api/component/newTaskList.dart';
import 'package:task_manager_api/component/progressTask.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int tabItem = 0;

  onTabItem(int index) {
    setState(() {
      tabItem = index;
    });
  }

  List<Widget> widgetOption = [
    Newtasklist(key: UniqueKey()),
    Progresstask(key: UniqueKey()),
    Completetask(key: UniqueKey()),
    Canceledtasklist(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: widgetOption[tabItem],
      bottomNavigationBar: appBottomNav(tabItem, onTabItem),
    );
  }
}
