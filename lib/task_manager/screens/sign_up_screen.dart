import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBG(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text('Join with us',
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
              decoration: InputDecoration(
                  hintText: 'First Name'
              ),
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Last name'
              ),
            ),

            SizedBox(height: 10,),

            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Mobile'
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

            FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined)),

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
      )),
    );
  }
}
