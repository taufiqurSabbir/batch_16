import 'package:flutter/material.dart';

class Class2 extends StatelessWidget {
  const Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [




          Text('Hello world',style: TextStyle(fontSize: 25),),

    Align(
        alignment: Alignment.topRight,
        child: Text('Hello world 2 ',style: TextStyle(fontSize: 25))),
          
          
          Container(
            padding: EdgeInsets.all(10), //inside
            margin: EdgeInsets.all(10), //outside
            alignment: Alignment.bottomCenter,

            height: 150,
            width: 150,


            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue , Colors.purple],
              begin: Alignment.topRight,
                end: Alignment.bottomLeft

              ),
              border: Border.all(width: 5,color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10) , bottomRight: Radius.circular(10)),


              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade200,
                  spreadRadius: 5,
                  offset: Offset(0, 5),
                  blurRadius: 5
                ),
                BoxShadow(
                  color: Colors.green.shade200,
                  spreadRadius: 5,
                  offset: Offset(5, 0),
                  blurRadius: 5
                )
              ]
            ),

            child: Text('Hello flutter',style: TextStyle(fontSize: 25),),
          )

          
        ],
      ),
    );
  }
}
