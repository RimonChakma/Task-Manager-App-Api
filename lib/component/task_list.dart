import 'package:flutter/material.dart';

ListView taskList(List taskItem) {
  return ListView.builder(
    itemCount: taskItem.length,
    itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.all(10),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskItem[index]["title"] ?? "No Title",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                taskItem[index]["description"] ?? "No Description",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
