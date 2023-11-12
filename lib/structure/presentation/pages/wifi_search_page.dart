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
            print("---------------Snapshot data NOT EMPTY");
            return PhotosList(photos: snapshot.data!);
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

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.photos});

  final List<SsidsFromUrl> photos;

  @override
  Widget build(BuildContext context) {
    print(photos.length);
    return Container(
      color: bgColorGrey,
      child: ListView.builder(
        itemCount: photos.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return UnitCardWiFi(
            unitImage: photos[index].url,
            unitSsid: photos[index].name,
          );
        },
      ),
    );
  }
}
