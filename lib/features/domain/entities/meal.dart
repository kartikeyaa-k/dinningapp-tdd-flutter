import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Meal extends Equatable {
  final String idMeal;

  final String strMeal;

  final String strCategory;

  final String strArea;

  final String strInstructions;

  final String strMealThumb;

  final String? strTags;

  final String strYoutube;

  const Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    required this.strYoutube,
  });

  @override
  List<Object> get props {
    return [
      idMeal,
      strMeal,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strYoutube
    ];
  }

  @override
  bool get stringify => true;
}
