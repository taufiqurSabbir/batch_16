import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/data/models/task_model.dart';
import 'package:flutter_16/task_manager/widget/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';


class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {





  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context,listen: false);
    Future<void>changeStatus(String taskID, String status) async {
      taskProvider.changeStatus(taskID, status);
      Navigator.pop(context);
      await  taskProvider.getAllTaskCount();
    }

    void showChangeStatusDialog(){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Card(
                child: ListTile(
                  title: Text('New'),
                  trailing: widget.taskModel.status == 'New' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                  onTap: (){
                    changeStatus(widget.taskModel.sId.toString(),'New');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Progress'),
                  trailing: widget.taskModel.status == 'Progress' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                  onTap: (){
                  changeStatus(widget.taskModel.sId.toString(),'Progress');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Completed'),
                  trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                  onTap: (){
                   changeStatus(widget.taskModel.sId.toString(),'Completed');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Cancelled'),
                  trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.check_circle,color: Colors.green,) : null,
                  onTap: (){
                   changeStatus(widget.taskModel.sId.toString(),'Cancelled');
                  },
                ),
              ),

            ],
          ),
        );
      });
    }


    Future<void>deleteTask()async{


      final success = taskProvider.deleteTask(widget.taskModel.sId.toString());

      if(await success){
        showSnackbar(context, 'Task deleted...!');
      }

    }


    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            widget.taskModel.title.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description.toString()
                 ),
              SizedBox(height: 5,),
              Text('Date: ${widget.taskModel.createdDate}',style: TextStyle(fontWeight: FontWeight.w500),),
              Row(
                children: [
                  Chip(
                    label: Text(' ${widget.taskModel.status} '),
                    backgroundColor: widget.cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      showChangeStatusDialog();
                    },
                    icon: Icon(
                      Icons.edit_note,
                      color: Colors.orange,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
