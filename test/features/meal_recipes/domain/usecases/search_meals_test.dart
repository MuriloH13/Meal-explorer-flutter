import 'package:flutter_test/flutter_test.dart';
import 'package:meal_explorer/features/meal_recipes/domain/repositories/meal_repository.dart';
import 'package:meal_explorer/features/meal_recipes/domain/usecases/search_meals.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late SearchMeals useCase;

  setUp(() {
    mockRepository = MockMealRepository();
    useCase = SearchMealsImpl(mockRepository);
  });


  group('SearchMeals', () {
    test(
      'Must call mockRepository.searchMealsByName and return List<MealDetail> when success',
      () async {
        when(
          () => mockRepository.searchMealsByName(any()),
        ).thenAnswer((_) async => tListMealDetail);

        final result = await useCase(tName);

        expect(result, tListMealDetail);
        verify(() => mockRepository.searchMealsByName(tName)).called(1);
      },
    );
  });
}
