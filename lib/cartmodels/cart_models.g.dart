// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelsAdapter extends TypeAdapter<CartModels> {
  @override
  final int typeId = 1;

  @override
  CartModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModels(
      id: fields[0] as String,
      image: fields[3] as String,
      isDeleted: fields[2] as bool,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CartModels obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
