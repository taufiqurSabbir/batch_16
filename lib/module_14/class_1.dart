import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController taskController = TextEditingController();
  List tasks = [];

  void addTask(){
    if(taskController.text.isNotEmpty){
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }else{

    }

  }


  void deleteTask(int index){
    setState(() {
      tasks.removeAt(index);
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    hintText: 'Add task',
                    border: OutlineInputBorder()
                  ),
                )),
                SizedBox(width: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){
                      addTask();
                    }, child: Text('Add'))
              ],
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,

                  itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: Checkbox(value: false, onChanged: (_){}),
                    title: Text(tasks[index]),
                    trailing: IconButton(onPressed: (){deleteTask(index);}, icon: Icon(Icons.delete,color: Colors.red,))
                  ),
                );

              }),
            )
          ],
        ),
      ),
    );
  }
}
