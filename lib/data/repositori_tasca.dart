import 'package:app_tasks/data/tasca.dart';
import 'package:hive/hive.dart';
// No necesitas importar uuid aquí a menos que generes IDs directamente en el repositorio

class RepositoriTasca {
  static const String nomBoxTasques = 'BoxTasques_app_tasques';

  // Metodo get
  Box<Tasca> _getBox() {
    return Hive.box<Tasca>(nomBoxTasques);
  }

  List<Tasca> getLlistaTasques() {
    return _getBox().values.toList();
  }

  Future<void> afegirTasca(Tasca tascaPerAgfegir) async {
    await _getBox().put(tascaPerAgfegir.id, tascaPerAgfegir);
  }

  // >>> NUEVO MÉTODO: Actualizar Tarea <<<
  Future<void> actualitzarTasca(Tasca tascaActualitzada) async {
    await _getBox().put(tascaActualitzada.id, tascaActualitzada);
    print('Tarea con ID ${tascaActualitzada.id} actualizada.');
  }

  // >>> NUEVO MÉTODO: Eliminar Tarea <<<
  Future<void> eliminarTasca(String idTascaAEliminar) async {
    await _getBox().delete(idTascaAEliminar);
    print('Tarea con ID $idTascaAEliminar eliminada.');
  }
}
