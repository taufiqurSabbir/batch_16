import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/screens/cancel_task_screen.dart';
import 'package:flutter_16/task_manager/screens/completed_task_screen.dart';
import 'package:flutter_16/task_manager/screens/create_task_screen.dart';
import 'package:flutter_16/task_manager/screens/new_task_screen.dart';
import 'package:flutter_16/task_manager/screens/progress_task_screen.dart';
import 'package:flutter_16/task_manager/widget/screen_bg.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int selectedIndex = 0;

  List screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'),
            ),
            SizedBox(width: 10,),

            Column(
              children: [
                Text('Taufiqur Sabbir',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
                Text('tau@gmail.com',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
              ],
            )
          ],
        ),
      ),
      body:  screens[selectedIndex],
      bottomNavigationBar: NavigationBar(

        selectedIndex: selectedIndex,

        onDestinationSelected: (int index){
          selectedIndex = index;
          setState(() {

          });
        },



          destinations: [
        NavigationDestination(icon: Icon(Icons.task), label: 'New'),
        NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.task_alt_outlined), label: 'Competed'),
        NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'Cancel'),
      ]),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTaskScreen()));

      }, child: Icon(Icons.add),),
    );
  }
}
