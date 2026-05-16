import 'package:flutter/material.dart';

class Module12Class1 extends StatelessWidget {
  const Module12Class1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login in Here...!',
              style: TextStyle(
                fontSize: 25
              ),
              ),
              SizedBox(height: 30,),
          
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  labelText: 'Enter Phone number',
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.check_circle,color: Colors.green,),
          
                  filled: true,
                  fillColor: Colors.grey.shade100,
          
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey
                    )
                  ),
          
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue,
                        width: 1
                      )
                  ),
                  border: OutlineInputBorder()
                ),

                validator:(value){
                  if(value == null || value.isEmpty){
                    return 'Please enter phone number';
                  }else if(value.length != 11){
                    return 'Please enter correct phone number';
                  }else{
                    return null;
                  }
                } ,
              ),



              SizedBox(height: 30,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Enter Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye,color: Colors.green,),
          
                    filled: true,
                    fillColor: Colors.grey.shade100,
          
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey
                        )
                    ),
          
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1
                        )
                    ),
          
          
          
          
          
          
          
                    border: OutlineInputBorder()
                ),

                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter password';
                  }else if(value.length < 6){
                    return 'password must be getter thn 6 cha';
                  }else{
                    return null;
                  }
                },

              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white
                    ),
          
                    onPressed: (){
                      if(formKey.currentState!.validate()){

                      }
                    }, child: Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
