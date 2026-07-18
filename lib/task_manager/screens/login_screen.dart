import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_16/task_manager/screens/sign_up_screen.dart';
import 'package:flutter_16/task_manager/widget/screen_bg.dart';

import 'main_nav_screen.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('Get Started With',
            style: Theme.of(context).textTheme.titleLarge,
            ),

            SizedBox(height: 25,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),

            SizedBox(height: 10,),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),

            SizedBox(height: 20,),

            FilledButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
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
      )),
    );
  }
}
