import 'package:flutter/material.dart';
import 'package:task_manager_api/component/task_list.dart';

import '../api/api_client.dart';

class Progresstask extends StatefulWidget {
  const Progresstask({super.key});

  @override
  State<Progresstask> createState() => _ProgresstaskState();
}

class _ProgresstaskState extends State<Progresstask> {

  List taskItem = [];
  bool isLoading = true;


  @override
  void initState() {
    callData();
    super.initState();
  }


  callData () async {

    final data = await TaskListRequest("progress");

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
