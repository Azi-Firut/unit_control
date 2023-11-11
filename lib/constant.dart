import 'package:flutter/material.dart';

//---------------------------
const urlRequestWiFiSsids = "https://breakingbadapi.com/api/characters";
//---------------------------
final List<String> ssidNames = [
  "RED",
  "YELLOW",
  "BLACK",
  "CYAN",
  "BLUE",
  "GREY",
  "GREY",
];
//----------------------------
final List<Widget> unitImages = [
  Card(
    child: Column(
      children: [
        Image.asset(
          "assets/images/units/MockDemoUnit.png",
          fit: BoxFit.contain,
        ),
        Text("Mock WiFi SSID"),
      ],
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Image.asset(
      "assets/images/units/MockDemoUnit.png",
      fit: BoxFit.cover,
    ),
  ),
  Container(
    color: Colors.yellow,
  ),
  Container(
    color: Colors.black,
  ),
  Container(
    color: Colors.cyan,
  ),
  Container(
    color: Colors.blue,
  ),
  Container(
    color: Colors.grey,
  ),
];
