import 'package:flutter/material.dart';
import 'package:task_manager/home_screen.dart';
import 'package:task_manager/ui/screens/canceled_screen.dart';
import 'package:task_manager/ui/screens/completed_screen.dart';
import 'package:task_manager/ui/screens/proggress_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedScreen = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    CompletedScreen(),
    CanceledScreen(),
    ProgressScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreen,
        onTap: (int index) {
          _selectedScreen = index;
          if (mounted) {
            setState(() {});
          }
        },
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Color(0xff21bf73),
        selectedLabelStyle: TextStyle(color: Color(0xff21bf73)),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_page_break_outlined), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all_rounded), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cancel_outlined), label: 'Canceled'),
          BottomNavigationBarItem(
              icon: Icon(Icons.change_circle_outlined), label: 'Progress'),
        ],
      ),
    );
  }
}
