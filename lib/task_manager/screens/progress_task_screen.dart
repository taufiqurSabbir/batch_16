import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widget/task_card.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getAllTaskByStatus('Progress');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Consumer<TaskProvider>(
        builder: (context, taskProvider,child) {
          return taskProvider.isLoading ? Center(child: CircularProgressIndicator()) : ListView.builder(

              itemCount:taskProvider.progressTask.length ,
              itemBuilder: (context,index){
                final task = taskProvider.progressTask[index];
                return   TaskCard(taskModel:task, cardColor: Colors.blue, refreshParent: () {
                  taskProvider.getAllTaskCount();
                  taskProvider.getAllTaskByStatus('Progress');
                },

                );
              });
        }
      )
    );
  }
}
