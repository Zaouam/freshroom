import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Card(
            image: "assets/lampe.png",
            title: "Lamp Div E8",
            price: "\n\$128",
          ),
          Card(
            image: "assets/lampe.png",
            title: "Lamp 2",
            price: "\n\£152",
          ),
          Card(
            image: "assets/lampe.png",
            title: "Mesba7",
            price: "\ndt125",
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key key,
    this.image,
    this.title,
    this.price,
  }) : super(key: key);

  final String image, title, price;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 20 / 2,
          bottom: 20 * 2.5,
        ),
        width: 150,
        child: Column(
          children: [
            Image.asset(image),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.white.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text: price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.shopping_bag),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
