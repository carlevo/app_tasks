import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'contacte.g.dart'; // <--- ¡ESTA ES LA LÍNEA QUE FALTABA!

@HiveType(
  typeId: 1,
) // Asigna un typeId único para Hive (1 para Contacte, 0 es para Tasca)
class Contacte extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String nom;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password; // Para guardar la contraseña, aunque en un entorno real sería una práctica a revisar.

  Contacte({
    required this.nom,
    required this.email,
    required this.password,
    String? id,
  }) : this.id = id ?? const Uuid().v4();

  // Método copyWith para crear una nueva instancia con valores modificados
  Contacte copyWith({
    String? id,
    String? nom,
    String? email,
    String? password,
  }) {
    return Contacte(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
