// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'un_approved_shipments_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnApprovedShipmentsEntityAdapter
    extends TypeAdapter<UnApprovedShipmentsEntity> {
  @override
  final int typeId = 3;

  @override
  UnApprovedShipmentsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnApprovedShipmentsEntity(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      fields[4] as String,
      fields[5] as String,
      fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UnApprovedShipmentsEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.idOfShipment)
      ..writeByte(1)
      ..write(obj.trackingString)
      ..writeByte(2)
      ..write(obj.typeOfShipment)
      ..writeByte(3)
      ..write(obj.idOfCustomer)
      ..writeByte(4)
      ..write(obj.nameOfCustomer)
      ..writeByte(5)
      ..write(obj.statusOfShipment)
      ..writeByte(6)
      ..write(obj.numberOfShipments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnApprovedShipmentsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
