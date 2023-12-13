import 'package:flutter/material.dart';
import 'package:unit_control/constant.dart';

class UnitCardWiFi extends StatefulWidget {
  UnitCardWiFi({
    super.key,
    required this.unitImage,
    required this.unitSsid,
    required this.unitPass,
  });
  final String unitImage;
  final String unitSsid;
  final String unitPass;
  @override
  State<UnitCardWiFi> createState() => _UnitCardWiFiState();
}

class _UnitCardWiFiState extends State<UnitCardWiFi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 9, bottom: 9),
      child: GestureDetector(
        ///  trow values to sand_box_wifi_connect
        onTap: () {
          const snackBar =
              SnackBar(content: Text('Add new Screen rout to Unit GUI'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Card(
          shadowColor: Colors.black,
          elevation: 8,
          surfaceTintColor: bgColorGrey,
          color: Colors.white,
          child: Column(
            children: [
              Image.network(widget.unitImage),
              //  Image.asset(widget.unitImage),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.unitSsid,
                  textScaleFactor: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
