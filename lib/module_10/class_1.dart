import 'package:flutter/material.dart';

class Module10Class1 extends StatelessWidget {
  const Module10Class1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class-1'),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              // padding: EdgeInsets.all(16),
              // margin: EdgeInsets.all(20),

              alignment: Alignment.center,
              width: 100,
              height: 100,
              transform: Matrix4.rotationZ(0.3),


              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2,color: Colors.red),
                boxShadow: [
                  BoxShadow(color: Colors.black26,
                  offset: Offset(10, 5),
                    blurRadius: 8
                  ),
                ]
              ),
              child: Text('Hello',style: TextStyle(color: Colors.white,fontSize: 20),),


            ),

            SizedBox(height: 20,),


            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10
                  )
                ]
              ),
              child: Row(
                children: [
                  CircleAvatar(radius: 50,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS19K2YX61HeCH6hIDzoz73rOZdHucCH1LU1A&s'),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Rahman',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                      Text('Cardiologist',style: TextStyle(fontSize: 16),)
                    ],
                  )
                ],
              ),
            ),



          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              )
            ],
          ),
          SizedBox(height: 10,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.grey,
              ),


              Positioned(

                right: 10,
                bottom: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              )
            ],
          )



          ],
        ),
      ),
    );
  }
}
