// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasca.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TascaAdapter extends TypeAdapter<Tasca> {
  @override
  final int typeId = 0;

  @override
  Tasca read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasca(title: fields[0] as String, completed: fields[1] as bool);
  }

  @override
  void write(BinaryWriter writer, Tasca obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TascaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
