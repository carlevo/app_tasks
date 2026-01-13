import 'package:app_tasks/Pages/Main_Page/BigDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/MidDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/SmallDevicesPage.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter();

  Hive.registerAdapter(TascaAdapter());

  await Hive.openBox<List<Tasca>>(RepositoriTasca.nomBoxTasques);

  runApp(const MainApp());
}

double screenWidth = 0;
String orientation = "";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final bool dispositiuWeb = kIsWeb;
    Size screenWidth = MediaQuery.of(context).size;

    //print(MediaQuery.of(context).size.height);
    //print(MediaQuery.of(context).size.width);
    //orientation = MediaQuery.of(context).orientation.name;
    //print(orientation);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screenWidth.width < 600
          ? mobileApp()
          : screenWidth.width < 1200
          ? tabletApp()
          : desktopApp(),
    );
  }
}

Widget mobileApp() {
  return Smalldevicespage();
}

Widget tabletApp() {
  return Middevicespage();
}

Widget desktopApp() {
  return Bigdevicespage();
}

/*Dependencias:
================
flutter pub add <nombre_dependencia>
flutter_slidable, hive, hive_flutter
*/
