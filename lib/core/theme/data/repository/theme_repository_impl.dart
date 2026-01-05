import 'package:enterprise/core/constants/storage_constants.dart';
import 'package:enterprise/core/theme/domain/entity/entity.dart';
import 'package:enterprise/core/theme/domain/repository/theme_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final FlutterSecureStorage secureStorage;
  ThemeRepositoryImpl({required this.secureStorage});
  @override
  Future<AppThemeMode> getThemeMode() async {
    final theme = secureStorage.read(key: StorageConstants.kTheme).toString();

    switch (theme) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      default:
        return AppThemeMode.system;
    }
  }

  @override
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    String value = StorageConstants.vSystem;
    if (themeMode == AppThemeMode.light) {
      value = StorageConstants.vLight;
    } else if (themeMode == AppThemeMode.dark) {
      value = StorageConstants.vDark;
    }
    await secureStorage.write(key: StorageConstants.kTheme, value: value);
  }
}
