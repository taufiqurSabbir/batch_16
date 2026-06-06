import 'package:flutter/material.dart';
class Home2 extends StatefulWidget {
  final String name;
  final int price;
  final Color color;
  final VoidCallback onTap;

  const Home2({super.key, required this.name, required this.price, required this.color, required this.onTap});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Home page'),  
      ),
      body: Center(
        child: Card(
          color: widget.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,style: TextStyle(fontSize: 30),),
              Text(widget.price.toString(),style: TextStyle(fontSize: 30),),

              ElevatedButton(onPressed: widget.onTap, child: Text('Submit')),

              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
