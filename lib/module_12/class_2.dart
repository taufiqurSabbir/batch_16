import 'package:flutter/material.dart';

class Class2Module12 extends StatefulWidget {
  const Class2Module12({super.key});

  @override
  State<Class2Module12> createState() => _Class2Module12State();
}

class _Class2Module12State extends State<Class2Module12> {
  bool Isexpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic ani'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(
                connectorColor: MaterialStateProperty.all(Colors.blue),
                currentStep: 2,
                steps: [
                  Step(title: Text('Order place'), content: SizedBox()),
                  Step(title: Text('Order Confirmed'), content: SizedBox()),
                  Step(title: Text('Processing'), content: SizedBox()),
                ]),
            InkWell(
              onTap: () {
                setState(() {
                  Isexpanded = !Isexpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                width: 250,
                height: Isexpanded ? 250 : 150,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Isexpanded = !Isexpanded;
                });
              },
              child: Container(
                width: 250,
                height: Isexpanded ? 250 : 150,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            AnimatedOpacity(
              opacity: Isexpanded ? 1 : 0,
              duration: Duration(seconds: 2),
              child: Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1500),
                duration: Duration(seconds: 10),
                builder: (context, value, child) {
                  return Text(
                    '৳ ${value.toInt()}',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  );
                }),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 0.9),
                duration: Duration(seconds: 10),
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      value: value,
                      minHeight: 10,
                    ),
                  );
                }),
            AnimatedAlign(
                alignment:
                    Isexpanded ? Alignment.topRight : Alignment.centerLeft,
                duration: Duration(seconds: 3), 
            child: Image.network(
                height: 50,

                'https://static.vecteezy.com/system/resources/thumbnails/044/012/937/small/side-view-white-suv-car-png.png'
            )
            
            )
          ],
        ),
      ),
    );
  }
}
