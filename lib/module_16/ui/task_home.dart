import 'package:flutter/material.dart';
import 'package:flutter_16/module_16/db/task_database.dart';
import 'package:flutter_16/module_16/models/task_model.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  List<TaskModel> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshTask();
  }


  Future<void> refreshTask()async {
    tasks = await TaskDatabase.getTask();
    setState(() {

    });
  }


  Future<void> addTask()async {
   await TaskDatabase.insertTask(TaskModel(title: taskController.text, isDone: false));
   await refreshTask();
   taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task with DB'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                        hintText: 'Enter task', border: OutlineInputBorder()),
                  ),
                ),
                IconButton(onPressed: addTask,
                icon: Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(value: task.isDone, onChanged: (_) => {}),
                      title: Text(task.title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_note,
                                color: Colors.orange,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
