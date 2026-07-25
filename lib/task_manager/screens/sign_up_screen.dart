import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/data/models/api_response.dart';
import 'package:flutter_16/task_manager/data/service/api_caller.dart';
import 'package:flutter_16/task_manager/screens/login_screen.dart';
import 'package:flutter_16/task_manager/utils/urls.dart';

import '../widget/screen_bg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  onTapLogin(){
    Navigator.pop(context);
  }

  Future<void>signUp() async {
    final ApiResponse response =await ApiCaller.postRequest(URL: TMUrls.SignupURL,
    body: {
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,
      "password":_passwordController.text
    }
    );
    
    if(response.isSuccess){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SignUp success.....!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something wrong..!')));

    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Text('Join with us',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 25,),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter email';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                    hintText: 'First Name'
                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please First name';
                  }else{
                    return null;
                  }
                },

              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    hintText: 'Last name'
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter last name';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                    hintText: 'Mobile'
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter mobile';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(height: 10,),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter password';
                  }else{
                    return null;
                  }
                },
              ),

              SizedBox(height: 20,),

              FilledButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  signUp();
                }
              }, child: Icon(Icons.arrow_circle_right_outlined)),

              SizedBox(height: 35,),

              Center(
                child: Column(
                  children: [

                    RichText(text: TextSpan(
                        text: "Have account ?",
                        style: TextStyle(
                            color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),
                        children: [
                          TextSpan(
                              text: " login",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                              ),
                              recognizer: TapGestureRecognizer()..onTap = onTapLogin

                          ),

                        ]
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
