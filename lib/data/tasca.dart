/*Fem servir la BD Hive.
Hive és una base de dades NoSQL,
Per a cada tipus d' objecte que volem guardar a la BD,
hem de crear una classe que hereti de HiveObject.
Instal•lar les dependéncies de desenvolupament (dev_dependencies:
 hive_generator
 build runner

Després d' haver creat aquesta classe, hem de generar
eI fitxer . g. dart corresponent, que farà
la serialització (conversió de l'objecte a dades
que es poden guardar a la BD, i viceversa).

Després, escriure part 'tasca.g.dart';
i executar a la terminal:
flutter pub run build_runner build
(cal haver parat l'execució de l' app si està en marxa).
Això ens generará l' arxiu tasca.g.dart automàticament .

 */

import 'package:hive/hive.dart';
part 'tasca.g.dart';

//flutter pub run build_runner build
//Genera un archivo que hara la conversion de este objeto nuestro
//a bytes para guardar en la base de datos

@HiveType(typeId: 0) //Puede ir de 0 a 255.
//HiveObject es la clase para guardar objetos de hiveobject
class Tasca extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool completed;

  Tasca({required this.title, this.completed = false});
}
