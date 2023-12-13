import 'package:flutter/material.dart';
import 'package:wiflutter/enums/enterprise_certificate_enum.dart';
import 'package:wiflutter/wiflutter.dart';

class ConnectToWiFi extends StatefulWidget {
  const ConnectToWiFi({super.key});

  @override
  State<ConnectToWiFi> createState() => _ConnectToWiFiState();
}

class _ConnectToWiFiState extends State<ConnectToWiFi> {
  final _wiFlutterPlugin = WiFlutter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await _wiFlutterPlugin.connect(
                      ssid: 'ZVER',
                      password: '12345678',
                      enterpriseCertificate: EnterpriseCertificateEnum.WPA2_PSK,
                      withInternet: false,
                      timeoutInSeconds: 400,
                    );
                  },
                  child: const Text("Connect")),
              ElevatedButton(
                  onPressed: () async {
                    await _wiFlutterPlugin.disconnect();
                  },
                  child: const Text("Disconnect")),
            ],
          ),
        ),
      ),
    );
  }
}
