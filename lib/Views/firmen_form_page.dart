import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Helpers/UserToken.dart';
import 'package:volkshandwerker/Models/LoginResponse.dart';
import 'package:volkshandwerker/Models/Subscriber.dart';
import 'package:volkshandwerker/Models/SubscriberResponse.dart';
import 'package:volkshandwerker/Models/User.dart';
import 'package:volkshandwerker/Services/NetworkManager.dart';
import 'package:volkshandwerker/Views/login_page.dart';
import 'package:volkshandwerker/Views/payment_page.dart';
import 'package:volkshandwerker/notifiers/UserNotifier.dart';

class FirmenFormPage extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => _MyFormState();
}

class _MyFormState extends ConsumerState<FirmenFormPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController steuerIdController = TextEditingController();
  TextEditingController anredeController = TextEditingController();
  TextEditingController vornameController = TextEditingController();
  TextEditingController nachnameController = TextEditingController();
  TextEditingController strasseController = TextEditingController();
  TextEditingController hausnummerController = TextEditingController();
  TextEditingController plzController = TextEditingController();
  TextEditingController stadtController = TextEditingController();
  TextEditingController telefonnummerController = TextEditingController();
  TextEditingController landController = TextEditingController();

  List<Map<String, String>> genderOptions = [
    {'displayName': 'Frau', 'name': 'female'},
    {'displayName': 'Herr', 'name': 'male'},
    {'displayName': 'Keine Angaben', 'name': 'notspecified'},
  ];

  List<Map<String, String>> countryOptions = [
    {'displayName': 'Deutschland', 'name': 'de'},
    {'displayName': 'Österreich', 'name': 'at'},
    {'displayName': 'Schweiz', 'name': 'ch'},
  ];

  String selectedGender = 'female';
  String selectedCountry = 'de';

  @override
  void initState() {
    super.initState();
    final isLoggedIn = ref.read(userNotifierProvider.notifier).isLoggedIn();

    UserToken.getToken().then((value) => {
          if (value != null)
            _userControl(value).then((user) => {
                  if (user != null)
                    {
                      ref
                          .read(userNotifierProvider.notifier)
                          .setUser(LoginResponse(user: user, jwt: value))
                    },
                  if (user != null && user?.subscriber != null)
                    {
                      // set user data to the form
                      companyNameController.text =
                          user.subscriber?.company?.name ?? '',
                      steuerIdController.text =
                          user.subscriber?.vatNumber ?? '',
                      /* anredeController.text =
                          user.subscriber['gender'] ?? 'female', */
                      vornameController.text = user.subscriber?.firstName ?? '',
                      nachnameController.text = user.subscriber?.lastName ?? '',
                      strasseController.text = user.subscriber?.street ?? '',
                      hausnummerController.text =
                          user.subscriber?.houseNumber ?? '',
                      plzController.text = user.subscriber?.postalCode ?? '',
                      stadtController.text = user.subscriber?.city ?? '',
                      telefonnummerController.text =
                          user.subscriber?.telephone ?? '',
                      //landController.text = user.subscriber['country'] ?? 'de',
                    }
                })
        });
  }

  Future<User?> _userControl(String token) async {
    NetworkManager networkManager =
        NetworkManager('https://api.volkshandwerker.de/api');
    User? userResponse = await networkManager.userControl(token);
    return userResponse;
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(userNotifierProvider);

    // check if user is logged in
    if (watch?.user != null && watch!.jwt.isEmpty) {
      return LoginPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: const Text('Handwerksbetrieb inserieren'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            buildTextInput('Firmenname', companyNameController),
            buildTextInput('Steuer-Id', steuerIdController),
            buildDropdown(
                'Anrede', genderOptions, anredeController, selectedGender),
            buildTextInput('Vorname', vornameController),
            buildTextInput('Nachname', nachnameController),
            buildTextInput('Straße', strasseController),
            buildTextInput('Hausnummer', hausnummerController),
            buildTextInput('PLZ', plzController),
            buildTextInput('Stadt', stadtController),
            buildTextInput('Telefonnummer', telefonnummerController),
            buildDropdown(
                'Land', countryOptions, landController, selectedCountry),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(245, 183, 89, 0.75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is validated, proceed to the next page or send data to API
                  sendDataToApi();
                }
              },
              child: Text('Weiter'),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget buildTextInput(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Dieses Feld ist erforderlich';
        }
        return null;
      },
    );
  }

  Widget buildDropdown(String label, List<Map<String, String>> options,
      TextEditingController controller, String selectedValue) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          controller.text = value!;
        });
      },
      items: options.map<DropdownMenuItem<String>>((option) {
        return DropdownMenuItem<String>(
          value: option['name']!,
          child: Text(option['displayName']!),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Dieses Feld ist erforderlich';
        }
        return null;
      },
    );
  }

  void sendDataToApi() {
    print('Data sent to API');
    var client = NetworkManager('https://api.volkshandwerker.de/api');
    var userId = ref.read(userNotifierProvider.notifier).subscriber?.id;

    final data = {
      "companyName": companyNameController.text,
      "firstName": vornameController.text,
      "lastName": nachnameController.text,
      "street": strasseController.text,
      "houseNumber": hausnummerController.text,
      "postalCode": plzController.text,
      "city": stadtController.text,
      "countryIso2": landController.text, // Burada country kodu gelecek
      "gender": "female", // Burada uygun bir değer belirlenmeli
      "genderText": anredeController.text, // Burada genderText gelecek
      "country": selectedCountry,
      "language": "de", // Burada uygun bir değer belirlenmeli
      "packId": "2",
      "telephone": telefonnummerController.text,
      "vatNumber": steuerIdController.text,
      "nameZahlungsempfaenger": companyNameController.text,
    };

    SubscriberUpdate subscriberUpdate = SubscriberUpdate.fromJson(data);

    client.updateSubscriber(subscriberUpdate, userId).then((value) => {
          if (value != null)
            {
              ref.read(userNotifierProvider.notifier).updateSubscriber(value),
              // Redirect payment page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
              ),
            }
          else
            {showFlashError(context, 'Fehler beim Speichern der Daten.')}
        });
  }
}

void showFlashError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
