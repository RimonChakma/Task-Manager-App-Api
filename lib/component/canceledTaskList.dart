import 'package:flutter/material.dart';
import 'package:task_manager_api/component/task_list.dart';

import '../api/api_client.dart';

class Canceledtasklist extends StatefulWidget {
  const Canceledtasklist({super.key});

  @override
  State<Canceledtasklist> createState() => _CanceledtasklistState();
}

class _CanceledtasklistState extends State<Canceledtasklist> {

  List taskItem = [];
  bool isLoading = true;


  @override
  void initState() {
    callData();
    super.initState();
  }


  callData () async {

    final data = await TaskListRequest("canceled");


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
