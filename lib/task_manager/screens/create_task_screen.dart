import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/widget/screen_bg.dart';

import '../data/models/api_response.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';
import 'main_nav_screen.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  Future<void>createTask() async {
    final ApiResponse response =await ApiCaller.postRequest(URL: TMUrls.createTask,
        body: {
          "title":titleController.text,
          "description": descriptionController.text,
          "status":"New"
        }
    );

    if(response.isSuccess){


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New task added')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something wrong..!')));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrN3fMD9X1_p5b6lRSCGcpDtH9BcgEOsEZLg&s'),
            ),
            SizedBox(width: 10,),

            Column(
              children: [
                Text('Taufiqur Sabbir',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
                Text('tau@gmail.com',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                ),),
              ],
            )
          ],
        ),
      ),

      body: ScreenBG(child: Column(
children: [
  Padding(
    padding: const EdgeInsets.all(28.0),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Text('Add new Task',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(height: 25,),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: 'Task Title'
            ),

            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter title';
              }else{
                return null;
              }
            },

          ),

          SizedBox(height: 10,),

          TextFormField(
            maxLines: 6,
            controller: descriptionController,

            decoration: InputDecoration(
                hintText: 'Description'
            ),

            validator: (value){
              if(value == null || value.isEmpty){
                return 'Please enter description';
              }else{
                return null;
              }
            },
          ),

          SizedBox(height: 20,),

          FilledButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              createTask();
            }
          }, child: Icon(Icons.arrow_circle_right_outlined)),




        ],
      ),
    ),
  )
],
      )),
    );
  }
}
