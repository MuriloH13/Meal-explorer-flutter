import '../../domain/entities/ingredient.dart';
import '../../domain/entities/meal_detail.dart';
import 'ingredient_model.dart';

class MealDetailModel extends MealDetail {
  const MealDetailModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.instructions,
    required super.ingredients,
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    final List<Ingredient> ingredientModel = extractIngredients(json);
    return MealDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredientModel,
    );
  }

  factory MealDetailModel.fromLocalJson(Map<String, dynamic> json) {
    List<dynamic> ingredients = json['ingredients'];
    final List<Ingredient> ingredientModels = ingredients
        .map(
          (e) => Ingredient(
            name: e['name'] as String,
            measure: e['measure'] as String,
          ),
        )
        .toList();

    return MealDetailModel(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredientModels,
    );
  }

  static List<Ingredient> extractIngredients(Map<String, dynamic> json) {
    final List<Ingredient> result = [];

    for (int i = 1; i <= 20; i++) {
      final ingredientName = json['strIngredient$i'] as String?;
      final measure = json['strMeasure$i'] as String?;

      if (ingredientName != null && ingredientName.trim().isNotEmpty) {
        result.add(
          Ingredient(name: ingredientName, measure: measure?.trim() ?? ''),
        );
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strMealThumb': imageUrl,
      'strInstructions': instructions,
      'ingredients': ingredients
          .map((e) => (e as IngredientModel).toJson())
          .toList(),
    };
  }
}
