import 'package:flutter/material.dart';
import 'package:task_manager_api/style/style.dart';

BottomNavigationBar appBottomNav (currentIndex,) {
  return BottomNavigationBar(items: [
    BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "New"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.access_time_rounded),
        label: "Progress"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_outlined),
        label: "Complete"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.cancel_outlined),
        label: "Canceled"
    ),
  ],
  selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );
}