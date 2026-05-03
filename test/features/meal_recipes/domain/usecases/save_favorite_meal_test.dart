import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/save_favorite_meal.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late SaveFavoriteMeal useCase;

  setUp(() {
    mockRepository = MockMealRepository();
    useCase = SaveFavoriteMealImpl(mockRepository);
  });

  setUpAll(() {
    registerFallbackValues();
  });

  group('SaveFavoriteMeal', () {
    test(
      'Must call mockRepository.saveFavoriteMeal and return void when success',
          () async {
        when(
              () => mockRepository.saveFavoriteMeal(any()),
        ).thenAnswer((_) async {});

        await useCase(tMealDetail);

        verify(() => mockRepository.saveFavoriteMeal(tMealDetail)).called(1);
      },
    );
  });
}
