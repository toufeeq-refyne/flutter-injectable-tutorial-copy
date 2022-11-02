import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/infrastructure/%20core/local_storage/i_local_storage_handler_facade.dart';

import 'hive/hive_data_storage_handler.dart';

@Singleton(as: ILocalStorageHandlerFacade, env: [Environment.dev])
class LocalStorageHandlerFacade implements ILocalStorageHandlerFacade {
  final HiveDataStorageHandler _hiveDataStorageHandler;

  LocalStorageHandlerFacade(
    this._hiveDataStorageHandler,
  );

  @override
  Future<bool> deleteCache() async {
    try {
      await _hiveDataStorageHandler.deleteCache();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getEmail() {
    return _hiveDataStorageHandler.getEmail();
  }

  @override
  Future<void> saveEmail(String? email) {
    return _hiveDataStorageHandler.saveEmail(email);
  }

  @override
  Future<void> saveShowRateDialog({
    required int disbursalTime,
    required bool shown,
  }) async {
    return _hiveDataStorageHandler.saveShowRateDialog(
      disbursalTime: disbursalTime,
      shown: shown,
    );
  }

  @override
  Future<bool> shouldShowRateDialog(
    int disbursalTime,
  ) async {
    return _hiveDataStorageHandler.shouldShowRateDialog(
      disbursalTime,
    );
  }

  @override
  Future<String?> getFcmToken() async {
    return _hiveDataStorageHandler.getFcmToken();
  }

  @override
  Future<void> saveFcmTokenLocally(
    String fcmToken,
  ) async {
    return _hiveDataStorageHandler.saveFcmToken(fcmToken);
  }

  @override
  Future<String?> getMobile() async {
    return _hiveDataStorageHandler.getMobile();
  }

  @override
  Future<String?> getUserId() async {
    return _hiveDataStorageHandler.getUserId();
  }

  @override
  Future<void> saveMobile(String? mobile) async {
    return _hiveDataStorageHandler.saveMobile(mobile);
  }

  @override
  Future<void> saveUserId(String? userId) async {
    return _hiveDataStorageHandler.saveUserId(userId);
  }

  @override
  Future<String?> getAppLanguage() async {
    return _hiveDataStorageHandler.getAppLanguage();
  }

  @override
  Future<void> saveAppLanguage({
    required String language,
  }) async {
    return _hiveDataStorageHandler.saveAppLanguage(language);
  }

  @override
  Future<Map<String, Map<String, String>>?> getLanguageMap() async {
    return _hiveDataStorageHandler.getLanguageMap();
  }

  @override
  Future<void> saveLanguageMap(
    Map<String, Map<String, String>> languageMap,
  ) async {
    await _hiveDataStorageHandler.saveLanguageMap(languageMap);
  }

  @override
  Future<bool> isIntroPageShown() async {
    return _hiveDataStorageHandler.isIntroPageShown();
  }

  @override
  Future<void> setIntroPageShown({
    required bool shown,
  }) async {
    return _hiveDataStorageHandler.setIntroPageShown(
      shown: shown,
    );
  }

  @override
  Future<String?> getLanguageVersion() async {
    return _hiveDataStorageHandler.getLanguageVersion();
  }

  @override
  Future<void> saveLanguageVersion(
    String languageVersion,
  ) async {
    return _hiveDataStorageHandler.saveLanguageVersion(
      languageVersion,
    );
  }

  @override
  Future<String?> getReferralCode() async {
    return _hiveDataStorageHandler.getReferralCode();
  }

  @override
  Future<void> saveReferralCode(
    String? referralCode,
  ) async {
    return _hiveDataStorageHandler.saveReferralCode(
      referralCode,
    );
  }

  @override
  Future<void> deleteReferralCode() async {
    return _hiveDataStorageHandler.deleteReferralCode();
  }

  @override
  Future<void> setPersonalDetailsConfirmed({
    bool? confirmed,
  }) async {
    await _hiveDataStorageHandler.setPersonalDetailsConfirmed(
      confirmed: confirmed,
    );
  }

  @override
  Future<bool?> personalDetailsConfirmed() async {
    return _hiveDataStorageHandler.personalDetailsConfirmed();
  }

  @override
  Future<void> deleteUserDocUpdateStatus() async {
    return _hiveDataStorageHandler.deleteUserDocUpdateStatus();
  }
}
