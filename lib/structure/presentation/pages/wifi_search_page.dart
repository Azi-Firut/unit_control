import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/structure/presentation/widgets/wifi_unit_card.dart';

class WiFiSearchPage extends StatefulWidget {
  const WiFiSearchPage({super.key});

  @override
  State<WiFiSearchPage> createState() => _WiFiSearchPageState();
}

class _WiFiSearchPageState extends State<WiFiSearchPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double rotationSizeChanged = screenWidth;
    if (screenHeight < screenWidth) {
      rotationSizeChanged = screenHeight;
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple.shade200,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.deepPurple[200],
          systemNavigationBarContrastEnforced: false,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      //
      body: SafeArea(
        child: Container(
          color: Colors.deepPurple.shade50,
          child: Center(
            child: SizedBox(
              width: rotationSizeChanged,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text("use data below");
                  // return UnitCardWiFi(photos[index].url, photos[index].name);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
