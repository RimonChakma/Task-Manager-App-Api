import 'package:flutter/material.dart';

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
