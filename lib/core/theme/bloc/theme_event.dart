
import 'package:enterprise/core/theme/domain/entity/entity.dart';

abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent{}
class ChangeTheme extends ThemeEvent{
  final AppThemeMode themeMode;
  ChangeTheme(this.themeMode);
}