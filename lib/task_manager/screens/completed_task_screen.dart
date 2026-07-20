import 'package:flutter/material.dart';

import '../data/models/task_model.dart';
import '../widget/task_card.dart';
class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
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
                status: 'Completed'

            ), cardColor: Colors.green, refreshParent: () {  },

            );
          }),
    );
  }
}
