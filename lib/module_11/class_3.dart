import 'package:flutter/material.dart';

class Module11Class3 extends StatelessWidget {
  const Module11Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class 3'),
        backgroundColor: Colors.orange,
      ),
       body: GridView.builder(
         itemCount: 20,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 4,
             crossAxisSpacing: 10,
             mainAxisSpacing: 10

           ),
           itemBuilder: (context,index){
             return Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Container(

                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Image.network('https://static.thenounproject.com/png/598867-200.png', height: 50,),
                 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Colors.redAccent.shade100
                  ])
                  
                ),
               ),

                 Text('Cash Out')
               ],
             );
           }

       ),


       //
       // GridView.count(
      //     crossAxisCount: 2,
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //
      //         children: [
      //           Container(
      //     color: Colors.red,
      // ),
      //           Container(
      //     color: Colors.blue,
      // ),
      //           Container(
      //     color: Colors.green,
      // ),
      //           Container(
      //             color: Colors.orange,
      //           ),
      //           Container(
      //             color: Colors.purple,
      //           ),
      //           Container(
      //             color: Colors.blueAccent,
      //           ),
      //   ],
      //
      //
      //
      // )



      // Column(
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //
      //         Container(
      //           height:70,
      //           width: 70,
      //           color: Colors.red,
      //         ),
      //
      //
      //         Container(
      //           height:70,
      //           width: 70,
      //           color: Colors.green,
      //         ),
      //
      //         Container(
      //           height:70,
      //           width: 70,
      //           color: Colors.blue,
      //         ),
      //
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
