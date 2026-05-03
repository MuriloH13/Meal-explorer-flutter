import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';

import '../repositories/meal_repository.dart';

abstract class SearchMeals {
  Future<List<MealDetail>> call(String name);
}

class SearchMealsImpl implements SearchMeals {
  final MealRepository repository;

  SearchMealsImpl (this.repository);

  @override
  Future<List<MealDetail>> call(String name) async {
    return await repository.searchMealsByName(name);
  }
}
