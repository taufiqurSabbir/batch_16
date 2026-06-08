import 'package:flutter/material.dart';
import 'package:flutter_16/module_11/widget/city_card.dart';

import '../module_12/class_1.dart';

class Module13Class3 extends StatefulWidget {
  const Module13Class3({super.key});

  @override
  State<Module13Class3> createState() => _Module13Class3State();
}

class _Module13Class3State extends State<Module13Class3> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        title: Text('Tab bar'),
        backgroundColor: Colors.orange,
        bottom: TabBar(

            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              
            ),
            
            indicatorPadding: EdgeInsets.all(1),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.purple,
            tabs: [
          Tab(icon: Icon(Icons.home),
          text: 'Home',
          ),
          Tab(icon: Icon(Icons.favorite_rounded),
          text: 'Fav',
          ),
          Tab(icon: Icon(Icons.settings),
          text: 'Setting',
          ),
        ]),
      ),
      
      body: TabBarView(
          controller: _tabController,
          children: [
        
        
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.red,
        //   child: Center(child: Text('Home')),
        // ),
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.blue,
        //   child: Center(child: Text('Fav')),
        // ),
        // Container(
        //   height: 100,
        //   width: 100,
        //   color: Colors.purple,
        //   child: Center(child: Text('Setting')),
        // ),


        CityCard(
        imageURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtdUhaC5rpDkzKbopf5UF90ccKowzRiYxE8A&s',
        title: 'Sylhet ',
        rating: '4.9',
      ),
      Module12Class1(),
        Column(
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtdUhaC5rpDkzKbopf5UF90ccKowzRiYxE8A&s'),
            Text('Custom UI')
          ],
        )

    ]));
  }
}
