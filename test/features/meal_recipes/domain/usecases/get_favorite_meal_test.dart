import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/get_favorite_meals.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

class MockMealRepository extends Mock implements MealRepository{}

void main() {
  late MockMealRepository mockRepository;
  late GetFavoriteMeals useCase;

  setUp(() {
    mockRepository = MockMealRepository();
    useCase = GetFavoriteMealsImpl(mockRepository);
  });

  group('GetFavoriteMeals', () {
    test('Must call mockRepository.getFavoriteMeals and return List<MealDetail> when success', () async {
      when(() => mockRepository.getFavoriteMeals()).thenAnswer((_) async => tListMealDetail);

      final result = await useCase();

      expect(result, tListMealDetail);
      verify(() => mockRepository.getFavoriteMeals()).called(1);
    });
  });
}