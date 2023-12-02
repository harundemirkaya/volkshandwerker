// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:volkshandwerker/notifiers/UserNotifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Models/User.dart';
import '../notifiers/UserNotifier.dart';
import 'package:volkshandwerker/Helpers/UserToken.dart';

class ProfilePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _watch = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: Text(
          "Profil",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              Text(
                "ANGABEN ZUM PROFIL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Anrede: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (_watch?.user?.subscriber.gender == "female")
                        ? "Frau"
                        : (_watch?.user?.subscriber.gender == "male")
                            ? "Herr"
                            : "Divers",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Vorname: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.firstName ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Nachname: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.lastName ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Straßenname: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.street ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Hausnummer: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.houseNumber ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Stadt: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.city ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Postleitzahl: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.postalCode ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Land: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (_watch?.user?.subscriber.countryIso2 == "de")
                        ? "DEUTSCHLAND"
                        : (_watch?.user?.subscriber.countryIso2 == "ch")
                            ? "Schweiz"
                            : (_watch?.user?.subscriber.countryIso2 == "at")
                                ? "Österreich"
                                : "Nicht angegeben",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "VAT-Nummer: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _watch?.user?.subscriber.vatNumber ?? "",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "VAT-Nummer: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    (_watch?.user?.subscriber?.company?.verificationStatus ==
                            "verified")
                        ? "verifiziert"
                        : "Nicht verifiziert",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 183, 89, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  // URL E YÖNLENDİRME
                },
                child: Text(
                  'Profil Bearbeiten',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
                  // SHOW DIALOG AÇMA, DIALOG UN İÇİNDE MOBİL ABONELİKLER İÇİN AYARLAR EKRANINI TARİF ETME, WEB ABONELİKLER İÇİN WEB E YÖNLENDİREN OKEY BUTONU EKLEME
                },
                child: Text(
                  'Kündigung des Abonnements',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
