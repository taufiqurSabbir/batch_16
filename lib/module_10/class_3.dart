import 'package:flutter/material.dart';

class Module10Class3 extends StatelessWidget {
  const Module10Class3({super.key});

  @override
  Widget build(BuildContext context) {

    Size ScreenSize = MediaQuery.of(context).size;
    double ScreenW = ScreenSize.width;
    double ScreenH = ScreenSize.height;

    final Orientation orientation = MediaQuery.of(context).orientation;


    return Scaffold(
      appBar: AppBar(
        title: Text('Class 3'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

    body: Center(
      child:orientation == Orientation.portrait ? Column(

        children: [

          Text(orientation.toString(),style: TextStyle(fontSize: 28),),

          Container(
            height: 100,
            width: 200,
            child: Text('Helllo dftghbftdrhbrftdhbrh drfgedgtyertgyhertgy edrghertdhgy dfghedrtgyhbrte Helllo dftghbftdrhbrftdhbrh drfgedgtyertgyhertgy edrghertdhgy dfghedrtgyhbrte',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.blue,

            ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          RichText(text: TextSpan(
            text: 'Hello',
            style: TextStyle(color: Colors.black),

            children: [
              TextSpan(
                text: 'Taufiqur',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)
              )
            ]
          )),


          RichText(text: TextSpan(
              text: 'Dont have account?',
              style: TextStyle(color: Colors.black,fontSize: 18),

              children: [
                TextSpan(
                    text: ' Sign up',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)
                )
              ]
          )),

          Text('Without',style: TextStyle(fontSize: 25),),
          Container(
            height: 150,
            width: 150,
            color: Colors.red,
          ),
          SizedBox(height: 20,),
          Container(
            height: ScreenH*0.16,
            width: ScreenW*0.3,
            color: Colors.green,
          ),


          Text('With mediaQ',style: TextStyle(fontSize: ScreenW*0.05),)
        ],
      ) : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
        
          children: [
        
            Text(orientation.toString(),style: TextStyle(fontSize: 28),),
        
            Container(
              height: 100,
              width: 200,
              child: Text('Helllo dftghbftdrhbrftdhbrh drfgedgtyertgyhertgy edrghertdhgy dfghedrtgyhbrte Helllo dftghbftdrhbrftdhbrh drfgedgtyertgyhertgy edrghertdhgy dfghedrtgyhbrte',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
        
              ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        
            RichText(text: TextSpan(
                text: 'Hello',
                style: TextStyle(color: Colors.black),
        
                children: [
                  TextSpan(
                      text: 'Taufiqur',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)
                  )
                ]
            )),
        
        
            RichText(text: TextSpan(
                text: 'Dont have account?',
                style: TextStyle(color: Colors.black,fontSize: 18),
        
                children: [
                  TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)
                  )
                ]
            )),
        
            Text('Without',style: TextStyle(fontSize: 25),),
            Container(
              height: 150,
              width: 150,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              height: ScreenH*0.16,
              width: ScreenW*0.3,
              color: Colors.green,
            ),
        
        
            Text('With mediaQ',style: TextStyle(fontSize: ScreenW*0.05),)
          ],
        ),
      ),
    ),

    );
  }
}
