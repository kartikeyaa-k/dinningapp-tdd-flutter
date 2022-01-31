import 'package:dinner_generator_app/features/domain/entities/drink.dart';
import 'package:hive/hive.dart';
part 'drink_model.g.dart';

class DrinkResponseModel {
  List<Drink> drinks;

  DrinkResponseModel({required this.drinks});

  factory DrinkResponseModel.fromJson(
      Map<String, dynamic> json) {
    return DrinkResponseModel(
        drinks: json['drinks'] != null
            ? List<DrinkModel>.from(
                (json['drinks'] as List<dynamic>)
                    .map((e) =>
                        DrinkModel.fromJson(e)))
            : []);
  }
}

@HiveType(typeId: 1)
class DrinkModel extends Drink {
  const DrinkModel({
    @HiveField(0) required String idDrink,
    @HiveField(1) required String strDrink,
    @HiveField(2) required String strCategory,
    @HiveField(3) required String strDrinkThumb,
    @HiveField(4) required String strAlcoholic,
    @HiveField(5) required String strGlass,
    @HiveField(6) required String strInstructions,
  }) : super(
            idDrink: idDrink,
            strDrink: strDrink,
            strCategory: strCategory,
            strDrinkThumb: strDrinkThumb,
            strAlcoholic: strAlcoholic,
            strGlass: strGlass,
            strInstructions: strInstructions);

  factory DrinkModel.fromJson(
      Map<String, dynamic> json) {
    return DrinkModel(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strCategory: json['strCategory'],
      strDrinkThumb: json['strDrinkThumb'],
      strAlcoholic: json['strAlcoholic'],
      strGlass: json['strGlass'],
      strInstructions: json['strInstructions'],
    );
  }
}
