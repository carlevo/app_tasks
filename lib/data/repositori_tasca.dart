import 'package:app_tasks/data/tasca.dart';
import 'package:hive/hive.dart';

class RepositoriTasca {
  static const String clauLlistaTasca = 'llistaTasques';
  static const String nomBoxTasques = 'BoxTasques_app_tasques';

  //Metodo get
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
}
