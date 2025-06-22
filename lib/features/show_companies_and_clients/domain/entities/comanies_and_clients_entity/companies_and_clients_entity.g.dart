// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_and_clients_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompaniesAndClientsEntityAdapter
    extends TypeAdapter<CompaniesAndClientsEntity> {
  @override
  final int typeId = 1;

  @override
  CompaniesAndClientsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompaniesAndClientsEntity(
      id: fields[0] as int,
      role: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompaniesAndClientsEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompaniesAndClientsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
