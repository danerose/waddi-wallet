// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigDaoAdapter extends TypeAdapter<ConfigDao> {
  @override
  final int typeId = 0;

  @override
  ConfigDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigDao(
      theme: fields[0] as ThemeMode,
      currency: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigDao obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.theme)
      ..writeByte(1)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
