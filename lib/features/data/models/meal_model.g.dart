// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealModelAdapter
    extends TypeAdapter<MealModel> {
  @override
  final int typeId = 0;

  @override
  MealModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };
    return MealModel(
        idMeal: fields[0] as String,
        strMeal: fields[1] as String,
        strCategory: fields[2] as String,
        strArea: fields[3] as String,
        strInstructions: fields[4] as String,
        strMealThumb: fields[5] as String,
        strTags: fields[6] as String,
        strYoutube: fields[7] as String);
  }

  @override
  void write(BinaryWriter writer, MealModel obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
