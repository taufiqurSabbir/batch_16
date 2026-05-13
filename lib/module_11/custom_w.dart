import 'package:flutter/material.dart';
import 'package:flutter_16/module_11/widget/city_card.dart';

class CutomW extends StatelessWidget {
  const CutomW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom w'),
        backgroundColor: Colors.orange,
      ),
      
      body: Column(
        children: [
          
          CityCard(imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoNE0fhlQgpWjNNtUnugodaTpsBAhO7H3AqQ&s', title: 'Cox', rating: '4.8',),
          SizedBox(height: 10,),
          CityCard(imageURL: 'https://bdscenictours.b-cdn.net/wp-content/uploads/2019/11/Sylhet-Scenic-Tour.jpg', title: 'sylhet', rating: '4.9',),
          SizedBox(height: 10,),
          CityCard(imageURL: 'https://objectstorage.ap-dcc-gazipur-1.oraclecloud15.com/n/axvjbnqprylg/b/V2Ministry/o/office-bandarban/2026/2/44ec2679-fd17-44cf-9c17-edbb8fb81d42.jpg', title: 'Ban', rating: '4.9',)

        ],
      ),
    );
  }
}

