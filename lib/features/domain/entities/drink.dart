import 'package:equatable/equatable.dart';

class Drink extends Equatable {
  final String idDrink;
  final String strDrink;
  final String strCategory;
  final String strDrinkThumb;
  final String strAlcoholic;
  final String strGlass;
  final String strInstructions;

  const Drink({
    required this.idDrink,
    required this.strDrink,
    required this.strCategory,
    required this.strAlcoholic,
    required this.strDrinkThumb,
    required this.strGlass,
    required this.strInstructions,
  });

  @override
  List<Object> get props {
    return [
      idDrink,
      strDrink,
      strCategory,
      strAlcoholic,
      strDrinkThumb,
      strGlass,
      strInstructions,
    ];
  }

  @override
  bool get stringify => true;
}
