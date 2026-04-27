import 'package:flutter/material.dart';

class Class3 extends StatelessWidget {
  const Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      // backgroundColor: Colors.grey.withOpacity(0.5),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Class-3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),

                onPressed: (){}, child: Text('Submit',style: TextStyle(fontSize: 20),)),

            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),

                  onPressed: (){}, child: Text('Submit',style: TextStyle(fontSize: 20),)),
            ),

            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),

                  onPressed: (){}, child: Text('Submit',style: TextStyle(fontSize: 20),)),
            ),
            
            OutlinedButton(
                style:OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ) ,

                onPressed: (){}, child: Text('Submit')),
            
            
            TextButton(onPressed: (){}, child: Text('See More')),
            
            Icon(Icons.account_circle_sharp, size: 50, color: Colors.blueAccent,),
            
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.delete,color: Colors.red,size: 50,)),
            
            
            GestureDetector(
                onTap: (){
                  print('on tap');
                },

                onLongPress: (){
                  print('on long press');
                },

                onDoubleTap: (){
                  print('D press');
                },

                child: Text('Test text',style: TextStyle(fontSize: 50),)),


            InkWell(
                onTap: (){
                  print('on tap');
                },

                onDoubleTap: (){
                  print('D tap');
                },

                onLongPress: (){
                  print('long tap');
                },

                child: Text('Test2',style: TextStyle(fontSize: 50),))

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
    );
  }
}
