import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/controller/auth_controller.dart';
import 'package:flutter_16/task_manager/data/models/user_model.dart';
import 'package:flutter_16/task_manager/screens/sign_up_screen.dart';
import 'package:flutter_16/task_manager/widget/screen_bg.dart';

import '../data/models/api_response.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';
import 'main_nav_screen.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }

  Future<void>login() async {
    final ApiResponse response =await ApiCaller.postRequest(URL: TMUrls.LoginURL,
        body: {
          "email":_emailController.text,
          "password":_passwordController.text
        }
    );

    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String token = response.responseData['token'];

      AuthController.saveUserData(model, token);
      
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login success.....!')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something wrong..!')));

    }
  }


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
              Text('Get Started With',
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
                  login();
                }
              }, child: Icon(Icons.arrow_circle_right_outlined)),

              SizedBox(height: 35,),

              Center(
                child: Column(
                  children: [
                    TextButton(onPressed: (){}, child: Text('Forget password ?', style: TextStyle(color: Colors.grey),),),

                    RichText(text: TextSpan(
                      text: "Don't have an account ?",
                      style: TextStyle(
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                        text: " Sign up",
                        style: TextStyle(
                            color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                            recognizer: TapGestureRecognizer()..onTap = onTapSignUp

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
