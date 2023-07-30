// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Services/NetworkManager.dart';

import '../notifiers/UserNotifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginResponse? _loginResponse;

  @override
  void initState() {
    super.initState();
    final isLoggedIn =
        ref.read(userNotifierProvider.notifier).state?.jwt != null;
    print("IsLoggedIn? $isLoggedIn");
    // pop until first page
    if (isLoggedIn) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  Future<bool> _loginRequest(String email, String password) async {
    NetworkManager networkManager =
        NetworkManager('https://api.volkshandwerker.de/api');
    LoginResponse? loginResponse =
        await networkManager.loginRequest(email, password);
    if (loginResponse == null) {
      return false;
    } else {
      ref.read(userNotifierProvider.notifier).setUser(loginResponse);
      setState(() {
        _loginResponse = loginResponse;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: Text('Anmelden'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
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
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 183, 89, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () async {
                    bool success = await _loginRequest(
                        _emailController.text, _passwordController.text);

                    if (!success) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('FEHLER'),
                          content: Text("Falscher Anmeldeversuch"),
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
                      print("success");
                    }
                  },
                  child: Text(
                    'EINLOGGEN',
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
