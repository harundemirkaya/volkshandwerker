import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: const Text('Datenschutzerklärung'),
      ),
      body: SingleChildScrollView(child: Text('Datenschutzerklärung')),
    );
  }
}
