import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'tasca.g.dart';

@HiveType(typeId: 0)
class Tasca extends HiveObject {
  @HiveField(0) // Este debería ser el ID
  String id;
  @HiveField(1) // Este debería ser el título
  String title;
  @HiveField(2) // Este debería ser isCompleted
  bool isCompleted; // <<-- Este es el nombre del campo

  Tasca({String? id, required this.title, this.isCompleted = false})
    : id = id ?? const Uuid().v4();

  Tasca copyWith({String? id, String? title, bool? isCompleted}) {
    return Tasca(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
