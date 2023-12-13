import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/structure/presentation/widgets/wifi_unit_card.dart';
import '../../../constant.dart';
import 'package:http/http.dart' as http;
import 'package:unit_control/structure/data/remote/models/wifi_ssid_model.dart';
import '../../data/remote/data_sources/wifi_ssid_from_url.dart';

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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: appColorGrey,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: appColorGrey,
          systemNavigationBarContrastEnforced: false,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: appColorGrey,
      ),
      body: FutureBuilder<List<SsidsFromUrl>>(
        future: fetchSsidsFromUrl(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot);
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            debugPrint("WiFiSearchPage - Snapshot data NOT EMPTY");
            return ScrollListOfScannedWiFi(
                listOfMapsParsedSSiDSandPass: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class ScrollListOfScannedWiFi extends StatelessWidget {
  const ScrollListOfScannedWiFi(
      {super.key, required this.listOfMapsParsedSSiDSandPass});

  final List<SsidsFromUrl> listOfMapsParsedSSiDSandPass;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        "WiFiSearchPage - ScrollListOfScannedWiFi -${listOfMapsParsedSSiDSandPass.length}");
    debugPrint(
        "WiFiSearchPage - ScrollListOfScannedWiFi - ${listOfMapsParsedSSiDSandPass.runtimeType}");

    return Container(
      color: bgColorGrey,
      child: ListView.builder(
        itemCount: listOfMapsParsedSSiDSandPass.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return UnitCardWiFi(
            unitImage: listOfMapsParsedSSiDSandPass[index].logo,
            unitSsid: listOfMapsParsedSSiDSandPass[index].name,
            unitPass: listOfMapsParsedSSiDSandPass[index].pass,
          );
        },
      ),
    );
  }
}
