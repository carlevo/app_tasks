import 'package:app_tasks/Pages/Main_Page/BigDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/MidDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/SmallDevicesPage.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}
  double screenWidth = 0;
  String orientation = "";

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    //final bool dispositiuWeb = kIsWeb;
    screenWidth = MediaQuery.of(context).size.width;
    
    //print(MediaQuery.of(context).size.height);
    //print(MediaQuery.of(context).size.width);
    //orientation = MediaQuery.of(context).orientation.name;
    //print(orientation);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screenWidth < 600 ? mobileApp() : screenWidth < 1200 ? tabletApp() : desktopApp(),
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
