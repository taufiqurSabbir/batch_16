import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widget/task_card.dart';
class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final taskProvider = Provider.of<TaskProvider>(context,listen: false);
      taskProvider.getAllTaskByStatus('Cancelled');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:   Consumer<TaskProvider>(
            builder: (context, taskProvider,child) {
              return taskProvider.isLoading? Center(child: CircularProgressIndicator()) :  ListView.builder(

                  itemCount:taskProvider.cancelledTask.length ,
                  itemBuilder: (context,index){
                    final task = taskProvider.cancelledTask[index];
                    return   TaskCard(taskModel:task, cardColor: Colors.blue, refreshParent: () {
                      taskProvider.getAllTaskCount();
                      taskProvider.getAllTaskByStatus('Cancelled');
                    },

                    );
                  });
            }
        )
    );
  }
}
