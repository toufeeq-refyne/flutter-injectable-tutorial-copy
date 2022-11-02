import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/infrastructure/onboarding/i_onboarding_facade.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: IOnboardingFacade, env: [Environment.test])
class MockOnboardingFacade extends Mock implements IOnboardingFacade {}