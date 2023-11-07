import 'package:flutter/material.dart';

class UnitCardWiFi extends StatefulWidget {
  const UnitCardWiFi({super.key});

  @override
  State<UnitCardWiFi> createState() => _UnitCardWiFiState();
}

class _UnitCardWiFiState extends State<UnitCardWiFi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 9, bottom: 9),
      child: Card(
        shadowColor: Colors.black,
        elevation: 8,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset("assets/images/units/RESEPI-XT32-1.png"),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Unit WiFi SSID",
                textScaleFactor: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
