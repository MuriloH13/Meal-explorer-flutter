import 'package:equatable/equatable.dart';

import 'ingredient.dart';

class MealDetail extends Equatable {
  MealDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.ingredients,
  });

  final String id;
  final String name;
  final String imageUrl;
  final String instructions;
  final List<Ingredient> ingredients;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, imageUrl, instructions, ingredients];
}
