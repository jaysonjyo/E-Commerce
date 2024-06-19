import 'package:flutter/material.dart';

import 'A.dart';
import 'N.dart';
import 'V.dart';
import 'first.dart';

class BottomNaviagtionScreen extends StatefulWidget {
  const BottomNaviagtionScreen({super.key});

  @override
  State<BottomNaviagtionScreen> createState() => _BottomNaviagtionScreenState();
}

class _BottomNaviagtionScreenState extends State<BottomNaviagtionScreen> {
  final screens = [Screen1(), N(), A(), V()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? Color(0xFF8204FF) : Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined,
                  color: currentIndex == 1 ? Color(0xFF8204FF) : Colors.black),
              label: "notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: currentIndex == 2 ? Color(0xFF8204FF) : Colors.black),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined,
                  color: currentIndex == 3 ? Color(0xFF8204FF) : Colors.black),
              label: "account")
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
