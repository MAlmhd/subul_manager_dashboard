// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rejected_shipment_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RejectedShipmentEntityAdapter
    extends TypeAdapter<RejectedShipmentEntity> {
  @override
  final int typeId = 4;

  @override
  RejectedShipmentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RejectedShipmentEntity(
      trackingNumber: fields[0] as String,
      customerName: fields[1] as String,
      type: fields[2] as String,
      declaredParcelsCount: fields[3] as int,
      status: fields[4] as String,
      reasonOfCancelltion: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RejectedShipmentEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.trackingNumber)
      ..writeByte(1)
      ..write(obj.customerName)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.declaredParcelsCount)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.reasonOfCancelltion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RejectedShipmentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
