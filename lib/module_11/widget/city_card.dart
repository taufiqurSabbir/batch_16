import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String imageURL,title,rating;
  const CityCard({
    super.key, required this.imageURL, required this.title, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

      ),
      child: ClipRRect(
        child: Stack(
          children: [
            Container(
                height: 500,
                width: 500,
                child: Image.network(imageURL)),
            Container(
              height: 265,
              color: Colors.black38,
            ),

            Positioned(
              top: 20,
              left: 20,
              child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Text('⭐ ${rating}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
