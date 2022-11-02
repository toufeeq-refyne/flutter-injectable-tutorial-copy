import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/infrastructure/%20core/local_storage/i_local_storage_handler_facade.dart';
import 'package:injectable_tutorial/infrastructure/onboarding/i_onboarding_facade.dart';

@Injectable(as: IOnboardingFacade, env: [Environment.prod, Environment.dev])
class OnboardingFacade implements IOnboardingFacade {
  final ILocalStorageHandlerFacade _localStorageFacade;

  OnboardingFacade(
    this._localStorageFacade,
  );

  @override
  Future<Map<String, Map<String, String>>?> getCachedLanguageMap() async {
    return {
      'indie': {'abc': 'asdd'}
    };
  }
}
