
import 'package:flutter/material.dart';
import 'package:flutter_16/home.dart';
import 'package:flutter_16/module_13/pages/about.dart';
import 'package:flutter_16/module_13/pages/home.dart';
class Module13Class2 extends StatefulWidget {
  const Module13Class2({super.key});

  @override
  State<Module13Class2> createState() => _Module13Class2State();
}

class _Module13Class2State extends State<Module13Class2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navi'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home2(name: 'xy product', price: 500, color: Colors.orange, onTap: () {
                print('Submitted');
              },)));

            }, child: Text('Home')),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Saved successfully')),
              );
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>about()));
            }, child: Text('About')),




            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/about');
            }, child: Text('about - 2')),


            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/about',);
            }, child: Text('about - 3')),
          ],
        ),
      ),
    );
  }
}
