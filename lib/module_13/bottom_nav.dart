import 'package:flutter/material.dart';

import '../module_11/class_2.dart';
import '../module_11/class_3.dart';
import '../module_12/class_1.dart';
import '../module_12/class_2.dart';
import 'class_3.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  List<Widget> screens = [
    Module13Class3(),
    Module11Class3(),
    Module12Class1(),
    Class2Module12()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,

          onDestinationSelected: (int index){
            selectedIndex = index;
            setState(() {

            });
          },


          destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.message), label: 'Inbox'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ]),
    );
  }
}
