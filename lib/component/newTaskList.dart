import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_api/api/api_client.dart';
import 'package:task_manager_api/component/task_list.dart';

class Newtasklist extends StatefulWidget {
  const Newtasklist({super.key});

  @override
  State<Newtasklist> createState() => _NewtasklistState();
}

class _NewtasklistState extends State<Newtasklist> {

  List taskItem = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    callData();
  }

  callData () async {

      final data = await TaskListRequest("newTask");



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
      },),
    );
  }
}
