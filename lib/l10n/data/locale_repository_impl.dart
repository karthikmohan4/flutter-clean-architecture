import 'package:enterprise/core/constants/storage_constants.dart';
import 'package:enterprise/l10n/domain/locale_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final SharedPreferences sharedPreferences;
  LocaleRepositoryImpl({required this.sharedPreferences});
  @override
  Future<Locale> getSavedLocale() async {
    final code = sharedPreferences.getString(StorageConstants.localeKey) ?? 'en';
    return Locale(code);
  }

  @override
  Future<void> saveLocale(Locale locale) async {
    await sharedPreferences.setString(
      StorageConstants.localeKey,
      locale.languageCode,
    );
  }
}
