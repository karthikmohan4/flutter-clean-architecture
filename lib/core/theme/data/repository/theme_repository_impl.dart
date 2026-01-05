import 'package:enterprise/core/constants/storage_constants.dart';
import 'package:enterprise/core/theme/domain/entity/entity.dart';
import 'package:enterprise/core/theme/domain/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final SharedPreferences storage;
  ThemeRepositoryImpl({required this.storage});
  @override
  Future<AppThemeMode> getThemeMode() async {
    final theme = storage.getString(StorageConstants.kTheme).toString();

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
    await storage.setString( StorageConstants.kTheme, value);
  }
}
