import 'package:flutter/material.dart';
import 'SignIn.dart';

class Skiper extends StatefulWidget {
  @override
  _Skiper createState() => _Skiper();
}

class _Skiper extends State<Skiper> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Image.asset('assets/freesh.png'), Text('Skip')],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/first.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Home Funiture",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contrary to popular belief, Lorem \nIpsum is not simply. It has roots in a \npiece of classical",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: 300,
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.red,
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ]));
  }
}
