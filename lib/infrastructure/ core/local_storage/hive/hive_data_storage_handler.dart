import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/injection.dart';

@LazySingleton(env: [Environment.dev])
class HiveDataStorageHandler {
  static const String keyEmail = 'email';
  static const String keyMobile = 'mobile';
  static const String keyUserId = 'userId';
  static const String keyAppLanguage = 'keyAppLanguage';
  static const String keyFcmToken = 'keyFcmToken';
  static const String keyUserStatus = 'userStatus';
  static const String keyTxnStatus = 'txnStatus';
  static const String keyEmployerInfo = 'employerInfo';
  static const String keyAppConfig = 'keyAppConfig';
  static const String keyLanguageJson = 'keyLanguageJson';
  static const String keyLanguageVersion = 'keyLanguageVersion';
  static const String keyIsIntroShown = 'keyIsIntroShown';
  static const String keyCustomerSupportInfo = 'keyCustomerSupportInfo';
  static const String keyDeviceInfo = 'keyDeviceInfo';
  static const String keyReferralCode = 'keyReferralCode';
  static const String keyPersonalInfoConfirmed = 'keyPersonalInfo';
  static const String previousDisbursalDialogShownTime = 'shownTime';
  static const String keyRegexMap = 'keyRegexMap';
  static const String keyUserDocUpdateStatus = 'keyUserDocUpdateStatus';

  final HiveBoxHandler _hiveBoxHandler;

  HiveDataStorageHandler(
    this._hiveBoxHandler,
  );

  Stream<BoxEvent> get appStorageChangeStream =>
      _hiveBoxHandler.appStorageBox.watch();

  Stream<BoxEvent> get userStorageChangeStream =>
      _hiveBoxHandler.userStatusStorageBox.watch();

  Stream<BoxEvent> get languageMapStream =>
      _hiveBoxHandler.appConfigBox.watch();

  Future<void> saveEmail(String? email) async {
    return _hiveBoxHandler.appStorageBox.put(keyEmail, email);
  }

  Future<String?> getEmail() async {
    final email = await _hiveBoxHandler.appStorageBox.get(keyEmail);
    return cast<String?>(email);
  }

  Future<void> deleteCache() async {
    await _hiveBoxHandler.clear();
  }

  Future<void> saveShowRateDialog({
    required int disbursalTime,
    required bool shown,
  }) async {
    await _hiveBoxHandler.appStorageBox.put(
      disbursalTime,
      shown,
    );

    await _hiveBoxHandler.appStorageBox.put(
      previousDisbursalDialogShownTime,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<bool> shouldShowRateDialog(
    int disbursalTime,
  ) async {
    final bool shouldShow =
        !(await _hiveBoxHandler.appStorageBox.get(disbursalTime) as bool? ??
            false);
    final previousShownDialogTimeShown = await _hiveBoxHandler.appStorageBox
            .get(previousDisbursalDialogShownTime) as int? ??
        0;
    return shouldShow &&
        DateTime.now().microsecondsSinceEpoch - previousShownDialogTimeShown >
            150;
  }

  Future<String?> getFcmToken() async {
    final fcmToken = await _hiveBoxHandler.appStorageBox.get(
      keyFcmToken,
    );
    return cast<String?>(fcmToken);
  }

  Future<void> saveFcmToken(String fcmToken) async {
    await _hiveBoxHandler.appStorageBox.put(
      keyFcmToken,
      fcmToken,
    );
  }

  Future<String?> getMobile() async {
    final mobile = await _hiveBoxHandler.appStorageBox.get(keyMobile);
    return cast<String?>(mobile);
  }

  Future<String?> getUserId() async {
    final userId = await _hiveBoxHandler.appStorageBox.get(keyUserId);
    return cast<String?>(userId);
  }

  Future<void> saveMobile(String? mobile) async {
    return _hiveBoxHandler.appStorageBox.put(keyMobile, mobile);
  }

  Future<void> saveUserId(String? userId) {
    return _hiveBoxHandler.appStorageBox.put(keyUserId, userId);
  }

  Future<String?> getAppLanguage() async {
    final appLanguage = await _hiveBoxHandler.appConfigBox.get(keyAppLanguage);
    return cast<String?>(appLanguage);
  }

  Future<void> saveAppLanguage(
    String language,
  ) async {
    return _hiveBoxHandler.appConfigBox.put(
      keyAppLanguage,
      language,
    );
  }

  Future<Map<String, Map<String, String>>?> getLanguageMap() async {
    final String? languageJson =
        _hiveBoxHandler.appConfigBox.get(keyLanguageJson) as String?;

    final Map? tempMap = languageJson != null
        ? cast<Map>(
            jsonDecode(languageJson),
          )
        : null;

    final Map<String, Map<String, String>>? languageMap =
        tempMap?.map((messageKey, messageLanguageMap) {
      return MapEntry(
        cast<String>(messageKey),
        (messageLanguageMap as Map<dynamic, dynamic>).map(
          (languageKey, message) => MapEntry(
            cast<String>(languageKey),
            cast<String>(message),
          ),
        ),
      );
    });

    return languageMap;
  }

  Future<void> saveLanguageMap(
    Map<String, Map<String, String>> languagesMap,
  ) async {
    final String languageJson = jsonEncode(languagesMap);
    await _hiveBoxHandler.appConfigBox.put(
      keyLanguageJson,
      languageJson,
    );
  }

  Future<bool> isIntroPageShown() async {
    return (_hiveBoxHandler.appConfigBox.get(
          keyIsIntroShown,
        ) ??
        false) as bool;
  }

  Future<void> setIntroPageShown({
    required bool shown,
  }) async {
    await _hiveBoxHandler.appConfigBox.put(
      keyIsIntroShown,
      shown,
    );
  }

  Future<String?> getLanguageVersion() async {
    final languageVersion = _hiveBoxHandler.appConfigBox.get(
      keyLanguageVersion,
    ) as String?;

    return languageVersion;
  }

  Future<void> saveLanguageVersion(
    String languageVersion,
  ) async {
    await _hiveBoxHandler.appConfigBox.put(
      keyLanguageVersion,
      languageVersion,
    );
  }

  Future<String?> getReferralCode() async {
    final String? referralCode = _hiveBoxHandler.appConfigBox.get(
      keyReferralCode,
    ) as String?;

    return referralCode;
  }

  Future<void> saveReferralCode(
    String? referralCode,
  ) async {
    await _hiveBoxHandler.appConfigBox.put(
      keyReferralCode,
      referralCode,
    );
  }

  Future<void> deleteReferralCode() async {
    await _hiveBoxHandler.appConfigBox.delete(
      keyReferralCode,
    );
  }

  Future<void> setPersonalDetailsConfirmed({
    bool? confirmed,
  }) async {
    await _hiveBoxHandler.appStorageBox.put(
      keyPersonalInfoConfirmed,
      confirmed,
    );
  }

  Future<bool?> personalDetailsConfirmed() async {
    return await _hiveBoxHandler.appStorageBox.get(keyPersonalInfoConfirmed)
        as bool?;
  }

  Future<void> deleteUserDocUpdateStatus() async {
    await _hiveBoxHandler.appStorageBox.delete(
      keyUserDocUpdateStatus,
    );
  }
}

class HiveBoxHandler {
  /// This storage box should be used only to save the data which will be used
  /// across the app. e.g: language, userId, email
  final Box<dynamic> appStorageBox;

  /// This storage box should be used only to save the userStatus
  /// It should not be used to save any other type of data
  final Box<Map<String, dynamic>> userStatusStorageBox;

  /// This should be used only to save app related configuration
  /// e.g: language version, or contact details
  final Box<dynamic> appConfigBox;

  HiveBoxHandler(
    this.appStorageBox,
    this.userStatusStorageBox,
    this.appConfigBox,
  );

  Future<void> clear() async {
    await appStorageBox.clear();
    await userStatusStorageBox.clear();
  }
}



@module
abstract class RegisterModule {
  // Do not change name.
  static const _appStorage = 'appStorage';
  static const _userStatusStorage = 'userStatusStorage';
  static const _appConfigStorage = 'appConfig';

  @preResolve
  @LazySingleton(env: [Environment.dev, Environment.test])
  Future<HiveBoxHandler> get hiveBoxHandler async {
    final Box<dynamic> appStorageBox = await Hive.openBox<dynamic>(
      _appStorage,
    );
    final Box<Map<String, dynamic>> userStatusStorageBox =
    await Hive.openBox<Map<String, dynamic>>(
      _userStatusStorage,
    );

    final Box<dynamic> appConfigBox = await Hive.openBox<dynamic>(
      _appConfigStorage,
    );

    return HiveBoxHandler(
      appStorageBox,
      userStatusStorageBox,
      appConfigBox,
    );
  }
}