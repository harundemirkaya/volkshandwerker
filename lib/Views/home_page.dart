// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:volkshandwerker/Services/NetworkManager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedOption = "Seçenek 1";
  List<Category> _categories = [];
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    NetworkManager networkManager =
        NetworkManager('https://api.volkshandwerker.de/api');
    List<Category> categories = await networkManager.fetchCategories();

    setState(() {
      _categories = categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: Image.asset(
          "lib/assets/logo.png",
          height: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
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
                      height: 20,
                    ),
                    Image.asset(
                      "lib/assets/home-page-image1.png",
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Ort',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: DropdownButtonFormField<String>(
                        value: null,
                        items: [
                          for (var category in _categories)
                            DropdownMenuItem(
                              value: category.name,
                              child: Text(category.name),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value ?? "";
                          });
                          print('Seçilen seçenek: $value');
                        },
                        decoration: InputDecoration(
                          hintText: 'Ort',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 183, 89, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text(
                          'SUCHEN',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Die große Handwerker Suchmaschine für Deutschland, Österreich und die Schweiz.",
                      style: TextStyle(
                          fontFamily: "Open Sans",
                          fontSize: 17,
                          color: Color.fromRGBO(50, 50, 93, 1)),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(245, 183, 89, 1),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "lib/assets/engineer.png",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Kennen Sie schon unser",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 18,
                      color: Color.fromRGBO(50, 50, 93, 1),
                    ),
                  ),
                  Text(
                    "Volkshandwerker Forum?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Registrieren Sie sich im Volkshandwerker Forum und werden ein wichtiges Mitglied der großen Community.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      color: Color.fromRGBO(82, 95, 127, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ergreifen Sie die Möglichkeit sich mit anderen Handwerkern und Bauherren auszutauschen.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Open Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(82, 95, 127, 1),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //
                      },
                      child: Text(
                        'Jetzt dem Forum beitreten',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(82, 95, 127, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
