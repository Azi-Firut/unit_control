import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_control/sand_box_01_fetch_api.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit control UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple.shade200,
          background: Colors.deepPurple[50],
        ),
        useMaterial3: false,
      ),
      home: MyHomePage(),
      //home: WiFiSearchPage(),
    );
  }
}

/////////////////////
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //  backgroundColor: Colors.cyan,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           // Status bar color
//           statusBarColor: Colors.red,
//           systemNavigationBarIconBrightness: Brightness.dark,
//           systemNavigationBarColor: Colors.cyanAccent,
//           systemNavigationBarContrastEnforced: true,
//
//           // Status bar brightness (optional)
//           statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//           statusBarBrightness: Brightness.light, // For iOS (dark icons)
//         ),
//         //
//         //
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
