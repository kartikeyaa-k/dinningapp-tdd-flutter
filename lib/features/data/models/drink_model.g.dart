// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkModelAdapter
    extends TypeAdapter<DrinkModel> {
  @override
  final int typeId = 1;

  @override
  DrinkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };
    return DrinkModel(
        idDrink: fields[0] as String,
        strDrink: fields[1] as String,
        strCategory: fields[2] as String,
        strDrinkThumb: fields[3] as String,
        strAlcoholic: fields[4] as String,
        strGlass: fields[5] as String,
        strInstructions: fields[6] as String);
  }

  @override
  void write(
      BinaryWriter writer, DrinkModel obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
