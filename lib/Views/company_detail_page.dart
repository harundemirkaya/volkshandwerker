// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CompanyDetailPage extends StatefulWidget {
  final String url;
  CompanyDetailPage({super.key, required this.url});

  @override
  _CompanyDetailPageState createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(
          245,
          183,
          89,
          1,
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        onPageFinished: (url) {
          _runJS();
        },
      ),
    );
  }

  void _runJS() async {
    final controller = await _controller.future;
    controller.runJavascriptReturningResult('''
      const dialogs = document.getElementsByTagName("ngneat-dialog");
      Array.from(dialogs).forEach(a => a.remove());
      const list = document.querySelector("body").classList
      list.remove(list[1])
      document.querySelector("body > app-root > div > div.app-container__header")?.remove();
      document.getElementsByClassName("section-header")[0]?.remove();
      document.querySelector("body > app-root > div > div.app-container__footer")?.remove();
      const element = document.getElementsByClassName("app-container__content")[0]
      if (element) element.style.paddingTop = "3rem";
    ''');
  }
}
