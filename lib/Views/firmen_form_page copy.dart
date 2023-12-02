import 'package:flutter/material.dart';

class FirmenFormPage extends StatelessWidget {
  const FirmenFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: const Text('Handwerksbetrieb inserieren'),
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
                    'Weiter',
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
          child: pageContent(),
        ),
      ),
    );
  }

  Column pageContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildInputField("Firmenname", null),
        const SizedBox(height: 10.0),
        buildInputField("Steuer-ID", null),
        const SizedBox(height: 10.0),
        buildDropdown("ANREDE", ["Frau", "Herr", "Keine Angaben"]),
      ],
    );
  }

  Widget buildInputField(String name, TextEditingController? controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: name,
        floatingLabelStyle: const TextStyle(color: Colors.orange),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      controller: controller,
    );
  }

  Widget buildDropdown(String name, List<String> options) {
    return DropdownButton<String>(
      value: options.first,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Center(
            child: Text(option),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // TODO: Handle dropdown value changes
      },
      style: const TextStyle(color: Colors.black),
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
    );
  }
}
