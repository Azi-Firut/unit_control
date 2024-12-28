import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// РАБОТАЕТ БЕЗ ПРОБЛЕМ
class WebMyApp extends StatelessWidget {
  final String namePage;
  WebMyApp({super.key, required this.namePage});
  String _url = 'http://192.168.12.1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(namePage),
        ),
        body: WebView(
          //allowsInlineMediaPlayback: true,
          //  initialUrl: "http://uitestingplayground.com", //  for test
          initialUrl: 'http://192.168.12.1', // Замените на URL вашего веб-сайта
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
