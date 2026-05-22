import 'package:flutter/material.dart';

class Module12Class3 extends StatefulWidget {
  const Module12Class3({super.key});

  @override
  State<Module12Class3> createState() => _Module12Class3State();
}

class _Module12Class3State extends State<Module12Class3> {
  double scale = 1.0;
  double dx = 0;
  double dy = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Extra'),
       backgroundColor: Colors.purple,
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(height: 20,),


       
           Text('Drag / pan'),
           GestureDetector(
             onPanUpdate: (details){
               setState(() {
                dx += details.delta.dx;
                dy += details.delta.dy;
               });
             },
             child: Transform.translate(
               offset: Offset(dx,dy),
               child: Container(
                 height: 100,
                 width: 100,
                 color: Colors.blue,
                 child: Center(child: Text('Drag me',style: TextStyle(color: Colors.white),)),
               ),
             ),
           ),


           SizedBox(height: 40,),

           Text('Horizontal Drag'),

           GestureDetector(
             onHorizontalDragUpdate: (details){
               setState(() {
                 dx += details.delta.dx;
               });
             },

             child: Transform.translate(
               offset: Offset(dx,dy),
               child: Container(
                 height: 100,
                 width: 100,
                 color: Colors.blue,
                 child: Center(child: Text('Drag me',style: TextStyle(color: Colors.white),)),
               ),
             ),
           ),

           SizedBox(height: 40,),


           Text('Vertical  Drag'),

           GestureDetector(
             onVerticalDragUpdate: (details){
               setState(() {
                 dy += details.delta.dy;
               });
             },

             child: Transform.translate(
               offset: Offset(dx,dy),
               child: Container(
                 height: 100,
                 width: 100,
                 color: Colors.blue,
                 child: Center(child: Text('Drag me',style: TextStyle(color: Colors.white),)),
               ),
             ),
           ),


           Text('Scale'),

           GestureDetector(
             onScaleUpdate: (details){
               setState(() {
                 scale += details.scale;
                 print(scale);
               });
             },

             child: Transform.scale(
               scale: scale,

               child: Container(

                 height: 120,
                 width: 120,
                 color: Colors.deepOrange,
                 child: Center(child: Text('Zoom me',style: TextStyle(color: Colors.white,fontSize: 20),)),
               ),
             ),
           )


         ],
       ),
     ),
   );
  }
}
