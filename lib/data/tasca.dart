import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'tasca.g.dart'; // Si usas hive_generator, asegúrate de correr flutter packages pub run build_runner build

@HiveType(typeId: 0)
class Tasca extends HiveObject {
  @HiveField(0)
  String id; // ID único para cada tarea
  @HiveField(1)
  String title;
  @HiveField(2)
  bool isCompleted; // Para el estado del checkbox

  Tasca({
    String?
    id, // Lo hacemos opcional para que se genere automáticamente si no se da
    required this.title,
    this.isCompleted = false, // Valor por defecto
  }) : id =
           id ??
           const Uuid().v4(); // Genera un ID único si no se proporciona uno

  // Método copyWith para crear una copia de la tarea con algunas propiedades modificadas
  Tasca copyWith({String? id, String? title, bool? isCompleted}) {
    return Tasca(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
