import 'package:meal_explorer/features/meal_recipes/domain/entities/meal_detail.dart';
import 'package:mocktail/mocktail.dart';

final tMealDetail = MealDetail(
  id: '52772',
  name: 'Chicken',
  imageUrl: 'thumb.jpg',
  instructions: '',
  ingredients: const [],
);

final tListMealDetail = [tMealDetail];
final tIdExample = '52772';
final tName = 'chicken';

void registerFallbackValues() {
  registerFallbackValue(tMealDetail);
}
