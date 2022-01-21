// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PuzzleAdapter extends TypeAdapter<Puzzle> {
  @override
  final int typeId = 102;

  @override
  Puzzle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Puzzle(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Puzzle obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cardValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PuzzleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
