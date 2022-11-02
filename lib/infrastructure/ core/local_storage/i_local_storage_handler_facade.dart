
abstract class ILocalStorageHandlerFacade {
  Future<void> saveEmail(String? email);

  Future<String?> getEmail();

  Future<void> saveUserId(String? userId);

  Future<String?> getUserId();

  Future<void> saveMobile(String? mobile);

  Future<String?> getMobile();

  Future<bool> deleteCache();

  Future<void> saveAppLanguage({
    required String language,
  });

  Future<String?> getAppLanguage();

  Future<bool> shouldShowRateDialog(
    int disbursalTime,
  );

  Future<void> saveShowRateDialog({
    required int disbursalTime,
    required bool shown,
  });

  Future<String?> getFcmToken();

  Future<void> saveFcmTokenLocally(
    String fcmToken,
  );

  Future<Map<String, Map<String, String>>?> getLanguageMap();

  Future<void> saveLanguageMap(
    Map<String, Map<String, String>> languageMap,
  );

  Future<bool> isIntroPageShown();

  Future<void> setIntroPageShown({
    required bool shown,
  });

  Future<String?> getLanguageVersion();

  Future<void> saveLanguageVersion(
    String version,
  );

  Future<String?> getReferralCode();

  Future<void> saveReferralCode(
    String? referralCode,
  );

  Future<void> deleteReferralCode();

  Future<void> setPersonalDetailsConfirmed({
    bool confirmed,
  });

  Future<bool?> personalDetailsConfirmed();

  Future<void> deleteUserDocUpdateStatus();
}
