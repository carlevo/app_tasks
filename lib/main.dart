import 'package:app_tasks/Pages/Main_Page/BigDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/MidDevicesPage.dart';
import 'package:app_tasks/Pages/Main_Page/SmallDevicesPage.dart';
import 'package:app_tasks/data/repositori_tasca.dart';
import 'package:app_tasks/data/tasca.dart';
// --- Añadidas importaciones para Contactes ---
import 'package:app_tasks/data/contacte.dart'; // Importa el modelo Contacte
import 'package:app_tasks/data/repositori_contacte.dart'; // Importa el repositorio de Contacte para el nombre de la caja
// --- Fin de las importaciones para Contactes ---
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// flutter run -d chrome --web-port 33333
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura que Flutter esté inicializado

  await Hive.initFlutter(); // Inicializa Hive para Flutter

  // --- Registrar adaptadores ---
  // El adaptador de Tasca ya estaba
  Hive.registerAdapter(TascaAdapter());
  // --- AHORA REGISTRAMOS EL ADAPTADOR DE CONTACTE ---
  Hive.registerAdapter(ContacteAdapter()); // ¡Esto es nuevo!

  // --- Abrir las cajas (boxes) ---
  // Abrir caja de Tasca con tipo Tasca
  await Hive.openBox<Tasca>(RepositoriTasca.nomBoxTasques);
  // --- AHORA ABRIMOS LA CAJA DE CONTACTE ---
  await Hive.openBox<Contacte>(
    RepositoriContacte.nomBoxContactes,
  ); // ¡Esto es nuevo!

  runApp(const MainApp());
}

double screenWidth =
    0; // Nota: Esta variable global no se usa actualmente en MainApp
String orientation =
    ""; // Nota: Esta variable global no se usa actualmente en MainApp

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final bool dispositiuWeb = kIsWeb;
    Size screenWidth = MediaQuery.of(
      context,
    ).size; // Variable local que oculta la global

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
