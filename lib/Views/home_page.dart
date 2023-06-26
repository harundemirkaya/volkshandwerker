import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 183, 89, 1),
        title: Image.asset(
          "lib/assets/logo.png",
          height: 40,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Center(
              child: Column(
            children: [
              Text(
                "Suchen Sie einen Handwerker?",
                style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 20,
                    color: Color.fromRGBO(255, 165, 0, 1)),
              ),
              Text(
                "Schluss mit dem Stress!",
                style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 17,
                    color: Color.fromRGBO(50, 50, 93, 1)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Die große Handwerker Suchmaschine für Deutschland, Österreich und die Schweiz.",
                style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 17,
                    color: Color.fromRGBO(50, 50, 93, 1)),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
