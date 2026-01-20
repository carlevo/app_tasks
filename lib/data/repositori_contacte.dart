import 'package:app_tasks/data/contacte.dart'; // Cambiado a Contacte
import 'package:hive/hive.dart';

class RepositoriContacte {
  static const String nomBoxContactes =
      'BoxContactes_app_contactes'; // Cambiado

  Box<Contacte> _getBox() {
    return Hive.box<Contacte>(nomBoxContactes); // Cambiado
  }

  List<Contacte> getLlistaContactes() {
    return _getBox().values.toList();
  }

  Future<void> afegirContacte(Contacte contactePerAfegir) async {
    await _getBox().put(contactePerAfegir.id, contactePerAfegir);
  }

  Future<void> actualitzarContacte(Contacte contacteActualitzat) async {
    await _getBox().put(contacteActualitzat.id, contacteActualitzat);
    print('Contacto con ID ${contacteActualitzat.id} actualizado.');
  }

  Future<void> eliminarContacte(String idContacteAEliminar) async {
    await _getBox().delete(idContacteAEliminar);
    print('Contacto con ID $idContacteAEliminar eliminado.');
  }
}
