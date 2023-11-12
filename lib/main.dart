import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/structure/presentation/pages/wifi_search_page.dart';

void main() {
  runApp(const MyUnitUI());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

class MyUnitUI extends StatelessWidget {
  const MyUnitUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WiFiSearchPage(),
    );
  }
}
