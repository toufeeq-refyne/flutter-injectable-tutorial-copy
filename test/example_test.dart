import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';
import 'package:injectable_tutorial/infrastructure/onboarding/i_onboarding_facade.dart';
import 'package:injectable_tutorial/injection.dart';
import 'package:mocktail/mocktail.dart';

import 'injection.dart';

void main() {
  late IOnboardingFacade onboardingFacade;
  setUpAll(() async {
    await setUpTestHive();
    configureInjection(Env.test);
    configureTestInjection(Env.test);

    onboardingFacade = getIt<IOnboardingFacade>();
  });

  test(
    "should do something",
    () async {
      // arrange
      final mockCounterRepository = getIt<ICounterRepository>();
      print('=======>${mockCounterRepository.runtimeType}');
      when(() => mockCounterRepository.getIncrement()).thenReturn(123);
      when(() => onboardingFacade.getCachedLanguageMap())
          .thenAnswer((_) async => {
                '123': {'456': '789'}
              });
      print(onboardingFacade.getCachedLanguageMap());
      // act
      print(mockCounterRepository.getIncrement());
      // assert
      verify(() => mockCounterRepository.getIncrement()).called(1);
    },
  );
}
