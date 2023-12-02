import 'package:flutter/material.dart';
import 'package:volkshandwerker/Views/firmen_form_page.dart';

class PackPage extends StatelessWidget {
  PackPage({super.key});

  final List<String> str = [
    "1 Logo als Profilbild",
    "Kontaktdaten (Anschrift + Telefonnummer)",
    "Beschreibung des Betriebes",
    "7 Bilder",
    "1 Filliale",
    "12 monatige Laufzeit",
    "1 monatige Kündigungsfrist"
  ];

  // Widget for the list of items
  _buildList(List<String> str) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: str.map((strone) {
        return Row(mainAxisSize: MainAxisSize.min, children: [
          const Text(
            "\u2022",
            style: TextStyle(fontSize: 20),
          ), //bullet text
          const SizedBox(
            width: 10,
          ), //space between bullet and text
          Expanded(
            child: Text(
              strone,
              style: const TextStyle(fontSize: 18),
            ), //text
          )
        ]);
      }).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: const Text('Unser Preisplan einfach gemacht'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            color: const Color.fromRGBO(245, 183, 89, 0.75),
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirmenFormPage()),
                );
              },
              child: const SizedBox(
                height: kToolbarHeight,
                child: Center(
                  child: Text(
                    'Auswählen',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Willkommen bei Volkshandwerker ! \n\nWir freuen uns dass Sie sich für Volkshandwerker entschieden haben. \n\nUm jetzt durchzustarten, wählen Sie bitte ein Paket aus.",
                style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Standard Paket",
                style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 93, 1),
                ),
              ),
              const Text(
                "( Mındestlaufzeit 12 Monate, danach Monatlich kündbar )",
                style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 14,
                  color: Color.fromRGBO(50, 50, 93, 1),
                ),
              ),
              _buildList(str),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(255, 236, 208, 0.76),
                ),
                child: const Text(
                  "7,99 €",
                  style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Pro Monat zzgl. MwSt.",
                style: TextStyle(
                  fontFamily: "Open Sans",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 93, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
