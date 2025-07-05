import 'package:flutter/material.dart';

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

    final data = await TaskListRequest("newTask");

    setState(() {
      isLoading = false;
      taskItem = data;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
