// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:volkshandwerker/Models/RegisterResponse.dart';
import 'package:volkshandwerker/Services/NetworkManager.dart';
import 'package:volkshandwerker/Views/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final ValueNotifier<bool> _checkBoxNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _checkBoxNotifierTwo = ValueNotifier(false);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterResponse? _registerResponse;

  Future<bool> _registerRequest(
      String username, String email, String password) async {
    NetworkManager networkManager =
        NetworkManager('https://api.volkshandwerker.de/api');
    RegisterResponse? registerResponse =
        await networkManager.registerRequest(username, email, password);
    if (registerResponse == null) {
      return false;
    } else {
      setState(() {
        _registerResponse = registerResponse;
      });
      return true;
    }
  }

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
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'E-Mail Adresse',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
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
                  onPressed: () async {
                    if (_checkBoxNotifier.value == true &&
                        _checkBoxNotifierTwo.value == true) {
                      bool success = await _registerRequest(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text);
                      if (!success) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('FEHLER'),
                            content: Text(
                                "Bitte füllen Sie Ihre Angaben vollständig aus"),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Erfolgreich!'),
                            content: Text(
                                "Deine Registrierung ist abgeschlossen. Bitte loggen Sie sich ein."),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('FEHLER'),
                          content:
                              Text('Bitte bestätigen Sie alle Berechtigungen.'),
                          actions: [
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
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
