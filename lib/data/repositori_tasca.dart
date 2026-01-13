import 'package:app_tasks/data/tasca.dart';
import 'package:hive/hive.dart';
// No necesitas importar uuid aquí a menos que generes IDs directamente en el repositorio

class RepositoriTasca {
  static const String clauLlistaTasca = 'llistaTasques';
  static const String nomBoxTasques = 'BoxTasques_app_tasques';

  // Metodo get
  Box<List<Tasca>> _getBox() {
    return Hive.box<List<Tasca>>(nomBoxTasques);
  }

  Future<void> setBox(List<Tasca> llistaTasques) async {
    await _getBox().put(clauLlistaTasca, llistaTasques);
  }

  List<Tasca> getLlistaTasques() {
    return _getBox().get(
      clauLlistaTasca,
      defaultValue: <Tasca>[Tasca(title: "Tasca d'exemple")],
    )!;
  }

  Future<void> afegirTasca(Tasca tascaPerAgfegir) async {
    final List<Tasca> llistaTasques = getLlistaTasques();
    llistaTasques.add(tascaPerAgfegir);
    await setBox(llistaTasques);
  }

  // >>> NUEVO MÉTODO: Actualizar Tarea <<<
  Future<void> actualitzarTasca(Tasca tascaActualitzada) async {
    final List<Tasca> llistaTasques = getLlistaTasques();
    final int index = llistaTasques.indexWhere(
      (tasca) => tasca.id == tascaActualitzada.id,
    );

    if (index != -1) {
      llistaTasques[index] = tascaActualitzada;
      await setBox(llistaTasques);
      print('Tarea con ID ${tascaActualitzada.id} actualizada.');
    } else {
      print(
        'La tarea con ID ${tascaActualitzada.id} no se encontró para actualizar.',
      );
    }
  }

  // >>> NUEVO MÉTODO: Eliminar Tarea <<<
  Future<void> eliminarTasca(String idTascaAEliminar) async {
    final List<Tasca> llistaTasques = getLlistaTasques();
    // Removemos la tarea que coincida con el ID
    llistaTasques.removeWhere((tasca) => tasca.id == idTascaAEliminar);
    await setBox(llistaTasques);
    print('Tarea con ID $idTascaAEliminar eliminada.');
  }
}
