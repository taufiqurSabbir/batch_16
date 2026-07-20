import 'package:flutter/material.dart';

import '../data/models/task_model.dart';
import '../widget/task_card.dart';
class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
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
                status: 'Cancelled'

            ), cardColor: Colors.red, refreshParent: () {  },

            );
          }),
    );
  }
}
