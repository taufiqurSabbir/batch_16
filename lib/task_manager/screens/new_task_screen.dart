import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/data/models/task_model.dart';
import 'package:flutter_16/task_manager/data/models/task_status_count.dart';
import 'package:flutter_16/task_manager/data/service/api_caller.dart';
import 'package:flutter_16/task_manager/providers/task_provider.dart';
import 'package:flutter_16/task_manager/utils/urls.dart';
import 'package:provider/provider.dart';

import '../widget/task_card.dart';
import '../widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getAllTaskCount();
      taskProvider.getAllTaskByStatus('New');
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider,child) {
          return Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskProvider.taskCountList.length,
                  itemBuilder: (context, index) {

                    final count = taskProvider.taskCountList[index];

                    return taskProvider.isLoading ? Center(child: CircularProgressIndicator()) : SizedBox(
                        width: 100,
                        child: TaskCountByStatus(
                          title: count.sId.toString(),
                          count: count.sum ?? 0,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 5,
                    );
                  },
                ),
              ),


            Expanded(
              child: taskProvider.isLoading ?Center(child: CircularProgressIndicator()) : ListView.builder(

                  itemCount:taskProvider.newTask.length ,
                  itemBuilder: (context,index){
                    final task = taskProvider.newTask[index];
                return   TaskCard(taskModel:task, cardColor: Colors.blue, refreshParent: () {
                 taskProvider.getAllTaskCount();
                 taskProvider.getAllTaskByStatus('New');
                },

                );
              }),
            )


            ],
          );
        }
      ),
    );
  }
}

