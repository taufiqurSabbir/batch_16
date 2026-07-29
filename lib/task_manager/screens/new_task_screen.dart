import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/data/models/task_model.dart';
import 'package:flutter_16/task_manager/data/models/task_status_count.dart';
import 'package:flutter_16/task_manager/data/service/api_caller.dart';
import 'package:flutter_16/task_manager/utils/urls.dart';

import '../widget/task_card.dart';
import '../widget/task_count_by_status.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  List<TaskStatusCountModel>taskCountList = [];


  Future<void>getAllTaskCount() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.taskCount);

    List<TaskStatusCountModel> temList=[];

    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data']){
        temList.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }

    taskCountList = temList;

    setState(() {

    });

  }

  List<TaskModel>taskList = [];

  Future<void>getAllTask() async {
    final response = await ApiCaller.getRequest(URL: TMUrls.AllTask('New'));

    List<TaskModel> temList=[];

    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data']){
        temList.add(TaskModel.fromJson(jsonData));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));

    }

    taskList = temList;

    setState(() {

    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
    getAllTask();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taskCountList.length,
              itemBuilder: (context, index) {

                return SizedBox(
                    width: 100,
                    child: TaskCountByStatus(
                      title: taskCountList[index].sId.toString(),
                      count: taskCountList[index].sum ?? 0,
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
          child: ListView.builder(
          
              itemCount:taskList.length ,
              itemBuilder: (context,index){
            return   TaskCard(taskModel:taskList[index], cardColor: Colors.blue, refreshParent: () {
              getAllTaskCount();
              getAllTask();
            },
          
            );
          }),
        )


        ],
      ),
    );
  }
}

