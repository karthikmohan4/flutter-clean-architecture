import 'package:enterprise/core/theme/domain/entity/entity.dart';

abstract class ThemeRepository {
  Future<AppThemeMode> getThemeMode();
  Future<void> setThemeMode(AppThemeMode themeMode);
}
