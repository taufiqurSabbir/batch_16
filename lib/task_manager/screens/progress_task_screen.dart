import 'package:flutter/material.dart';

import '../data/models/task_model.dart';
import '../widget/task_card.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   ListView.builder(

          itemCount: 10,
          itemBuilder: (context,index){
            return   TaskCard(taskModel: TaskModel(
                title: 'task title',
                description: 'this is description',
                createdDate: '20/10/26',
                status: 'Progress'

            ), cardColor: Colors.purple, refreshParent: () {  },

            );
          }),
    );
  }
}
