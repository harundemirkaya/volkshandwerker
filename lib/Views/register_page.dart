// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final ValueNotifier<bool> _checkBoxNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _checkBoxNotifierTwo = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: Text('Handwerksbetrieb inserieren'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'E-Mail Adresse',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Passwort',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _checkBoxNotifier,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: Text(
                        'Ich habe die Allgemeinen Geschäftsbedingungen und Datenschutzrichtlinien gelesen und stimme diesen zu'),
                    value: value,
                    onChanged: (bool? newValue) {
                      _checkBoxNotifier.value = newValue ?? false;
                    },
                  );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _checkBoxNotifierTwo,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: Text(
                        'Ich habe die Widerrufsbelehrung gelesen Widerrufsbelehrung'),
                    value: value,
                    onChanged: (bool? newValue) {
                      _checkBoxNotifierTwo.value = newValue ?? false;
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
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
                    'Registrieren',
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
      ),
    );
  }
}
