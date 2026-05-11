import 'package:flutter/material.dart';

class Module11Class2 extends StatelessWidget {
  const Module11Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: Colors.blue,
      ),
      
      body:  ListView.separated(
        itemCount: 20,
          itemBuilder: (context,index){
    return Card(
            child: ListTile(

                    title: Text('Taufiq ${index}'),
                    subtitle: Text('01792945445'),
                    leading: Icon(Icons.phone),
                    trailing: Icon(Icons.delete, color: Colors.red,),
                  ),
          );
    },
          separatorBuilder: (context,index){
          return Divider(

            thickness: 1,
            color: Colors.grey,
          );
          },


      )



      // ListView.builder(
      //
      //     itemCount: 20,
      //     itemBuilder: (context,index){
      //       return Card(
      //         child: ListTile(
      //
      //                 title: Text('Taufiq ${index}'),
      //                 subtitle: Text('01792945445'),
      //                 leading: Icon(Icons.phone),
      //                 trailing: Icon(Icons.delete, color: Colors.red,),
      //               ),
      //       );
      //     },
      //
      // )


      // ListView(
      //   children: [
      //     Card(
      //
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete, color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete, color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete, color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete, color: Colors.red,),
      //       ),
      //     ),
      //     Card(
      //
      //       child: ListTile(
      //         title: Text('Taufiq'),
      //         subtitle: Text('01792945445'),
      //         leading: Icon(Icons.phone),
      //         trailing: Icon(Icons.delete, color: Colors.red,),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
