import 'package:flutter/material.dart';
class WidgetLifeCycle extends StatefulWidget {
   WidgetLifeCycle({super.key}){
    print('1 Constructor');
  }

  @override
  State<WidgetLifeCycle> createState(){
     print('2 create state');
    return _WidgetLifeCycleState();
  }
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {

  int number = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('3 init state');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('4 did');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter app'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(number.toString(),style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),),
            
            SizedBox(height: 20,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    number++;
                    print(number);
                  });

                }, child: Text('+',style: TextStyle(fontSize: 25),)),
                ElevatedButton(onPressed: (){
                  setState(() {
                    number--;
                    print(number);
                  });

                }, child: Text('-',style: TextStyle(fontSize: 25),))
              ],
            )
          ],
        ),
      ),

    );
  }
}
