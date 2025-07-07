import 'package:flutter/material.dart';
import 'package:task_manager_api/component/task_list.dart';

import '../api/api_client.dart';

class Completetask extends StatefulWidget {
  const Completetask({super.key});

  @override
  State<Completetask> createState() => _CompletetaskState();
}

class _CompletetaskState extends State<Completetask> {

  List taskItem = [];
  bool isLoading = true;


  @override
  void initState() {
    callData();
    super.initState();
  }


  callData () async {

    final data = await TaskListRequest("completed");

    setState(() {
      isLoading = false;
      taskItem = data;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading?Center(child: CircularProgressIndicator(),):RefreshIndicator(
          child: taskList(taskItem), onRefresh:() async{
          await callData();
        },),);
  }
}
