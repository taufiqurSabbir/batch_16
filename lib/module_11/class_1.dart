import 'package:flutter/material.dart';

class Module11Class1 extends StatelessWidget {
  const Module11Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module-11 class-1'),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://www.laurewanders.com/wp-content/uploads/2023/02/Things-to-do-in-Coxs-Bazar-33.jpg',
          
              ),
          
              Image.asset('asset/YT.png'),
          
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  helperText: 'Phone number',
                  hintText: 'Enter phone number',
                  labelText: 'Phone number',
          
                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue
                  ),
          
                  hintStyle: TextStyle(
                    fontSize: 20
                  ),
          
                  prefixIcon: Icon(Icons.phone),
                  suffixIcon: Icon(Icons.check_box),
          
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
          
                ),
              ),

              SizedBox(height: 10,),

              TextField(
                obscureText: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  helperText: 'Password',
                  hintText: 'Enter Password',
                  labelText: 'Password',

                  helperStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue
                  ),

                  hintStyle: TextStyle(
                    fontSize: 20
                  ),

                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                  )

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
