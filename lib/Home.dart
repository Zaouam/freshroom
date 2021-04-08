import 'card.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;

  const Home({Key key, this.user}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget storie({String image, String name}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 10),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset('assets/freesh.png'),
                ),
                Container(
                  child: Row(children: <Widget>[
                    Icon(Icons.notifications),
                    Icon(Icons.shopping_bag)
                  ]),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 70,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    storie(
                        image:
                            'http://www.meubles-en-carton-titelion.com/images/meuble-cuisine-urban-lapeyre_5.jpg',
                        name: 'All Categories'),
                    storie(
                        image:
                            'https://i.habitatetjardin.com/files/produits/1366/meuble-tv-93476_vue0.jpg',
                        name: 'Furniture'),
                    storie(
                        image:
                            'https://altobuy.fr/57452-thickbox_default/lizea-meuble-tv-2-portes-avec-niche-centrale.jpg',
                        name: 'Decor'),
                    storie(
                        image:
                            'https://www.kasalinea.com/boutique/images_produits/meuble-television-155-chene-gris_zd2-z.jpg',
                        name: 'Furnishings'),
                    storie(
                        image:
                            'http://www.meubles-en-carton-titelion.com/images/meuble-cuisine-urban-lapeyre_5.jpg',
                        name: 'Furnishings'),
                    storie(
                        image:
                            'https://i.habitatetjardin.com/files/produits/1366/meuble-tv-93476_vue0.jpg',
                        name: 'Furnishings'),
                  ],
                ),
              )),
          SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 200,
                width: 310,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.designferia.com/sites/default/files/field/image/chaises-de-salle-a-manger-moderne.jpg'),
                    ),
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                height: 10,
              ),
              Cards(),
            ]),
          ),
        ],
      ),
    );
  }
}
