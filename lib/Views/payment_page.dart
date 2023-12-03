import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:volkshandwerker/Models/AppleModel.dart';
import 'package:volkshandwerker/Models/ApplePay.dart';
import 'package:volkshandwerker/Models/ApplePayPrice.dart';
import 'package:volkshandwerker/Services/NetworkManager.dart';
import 'package:volkshandwerker/notifiers/UserNotifier.dart';
import 'package:pay/pay.dart';
import 'package:volkshandwerker/payment/payment_configurations.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState createState() => _MyFormState();
}

class _MyFormState extends ConsumerState<PaymentPage> {
  bool optionalCheckbox = false;
  bool requiredCheckbox1 = false;
  bool requiredCheckbox2 = false;

  bool isButtonDisabled = true;

  String os = Platform.operatingSystem;

  final Future<AppleModel> _applePayConfigFuture =
      NetworkManager('https://api.volkshandwerker.de/api').applePayConfig();

  //.applePayConfiguration();

  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    paymentItems: const [
      PaymentItem(
          label: 'Standard Paket',
          amount: '7.99',
          status: PaymentItemStatus.final_price,
          type: PaymentItemType.total)
    ],
    style: ApplePayButtonStyle.black,
    type: ApplePayButtonType.buy,
    width: double.infinity,
    height: 50,
    onPaymentResult: (result) => print(result),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  FutureBuilder _applePayButtonBuilder() {
    return FutureBuilder<AppleModel>(
      future: _applePayConfigFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var item = snapshot.data!.item!;
          return ApplePayButton(
            paymentConfiguration:
                PaymentConfiguration.fromJsonString(snapshot.data!.config!),
            paymentItems: [
              PaymentItem(
                  label: item.label!,
                  amount: item.amount!,
                  status: item.status == 'final_price'
                      ? PaymentItemStatus.final_price
                      : item.status == 'pending'
                          ? PaymentItemStatus.pending
                          : PaymentItemStatus.unknown,
                  type: PaymentItemType.total)
            ],
            style: ApplePayButtonStyle.black,
            type: ApplePayButtonType.buy,
            width: double.infinity,
            height: 50,
            onPaymentResult: (result) => onApplePayResult(result),
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
        title: const Text('Handwerksbetrieb inserieren'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AbsorbPointer(
            absorbing: isButtonDisabled,
            child: Platform.isIOS
                ? _applePayButtonBuilder()
                : Text('Payment is not supported on $os'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Meine Untemehmensdaten',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        )),
                    const SizedBox(height: 5),
                    Text('${watch?.user?.subscriber?.nameZahlungsempfaenger}'),
                    Text(
                        '${watch?.user?.subscriber?.firstName} ${watch?.user?.subscriber?.lastName}'),
                    Text(
                        '${watch?.user?.subscriber?.street} ${watch?.user?.subscriber?.houseNumber}'),
                    Text(
                        '${watch?.user?.subscriber?.postalCode} ${watch?.user?.subscriber?.city}'),
                    const SizedBox(height: 10),
                    const Text('E-Mail',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        )),
                    Text('${watch?.user?.email}'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    Text(
                        'Ich ermächtige die VHW UG haftungsbeschränkt wiederkehrende Zahlungen von meinem Konto mittels ( Lastschrift oder Kreditkarte ) einzuziehen.'),
                    SizedBox(height: 10),
                    Text(
                        'Zugleich weise ich mein Kreditinstitut an, die von VHW UG haftungsbeschränkt auf mein Konto gezogenen Lastschriften einzulösen.'),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: optionalCheckbox,
                    onChanged: (value) {
                      setState(() {
                        optionalCheckbox = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "Newsletter & Tipps zur Nutzung von Volkshandwerker erhalten.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: requiredCheckbox1,
                    onChanged: (value) {
                      setState(() {
                        requiredCheckbox1 = value!;
                        checkButtonState();
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      "Ich akzeptiere den Vertrag zur Auftragsverarbeitung.",
                      style: TextStyle(
                        color: requiredCheckbox1 ? Colors.black : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: requiredCheckbox2,
                    onChanged: (value) {
                      setState(() {
                        requiredCheckbox2 = value!;
                        checkButtonState();
                      });
                    },
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          text: "Ich stimme den ",
                          style: TextStyle(
                            color:
                                requiredCheckbox2 ? Colors.black : Colors.red,
                          ),
                          children: [
                            const TextSpan(
                              text: "Datenschutzbestimmungen ",
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                            TextSpan(
                              text: "und den ",
                              style: TextStyle(
                                color: requiredCheckbox2
                                    ? Colors.black
                                    : Colors.red,
                              ),
                            ),
                            const TextSpan(
                              text: "AGB",
                              style: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                            TextSpan(
                              text: " zu.",
                              style: TextStyle(
                                color: requiredCheckbox2
                                    ? Colors.black
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onApplePayResult(paymentResult) async {
    // Send the resulting Apple Pay token to your server / PSP

    print(jsonEncode(paymentResult));
    var jsonData = jsonEncode(paymentResult);
    var data = await NetworkManager('https://api.volkshandwerker.de/api')
        .makeApplePayPayment(jsonData);

    if (data == null) {
      return showFlashError(context, 'etwas ist schief gelaufen');
    }

    if (data?['success'] == true) {
      showFlashError(context, data?['message'] ?? 'Payment successful');
    } else {
      showFlashError(context, data?['message'] ?? 'Payment failed');
    }

    if (data?['redirect'] == true) {
      Navigator.pushNamed(context, '/home');
    }
  }

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }

  void checkButtonState() {
    setState(() {
      if (requiredCheckbox1 && requiredCheckbox2) {
        isButtonDisabled = false;
      } else {
        isButtonDisabled = true;
      }
    });
  }

  void showFlashError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
