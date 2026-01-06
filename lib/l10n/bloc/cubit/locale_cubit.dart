import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enterprise/l10n/domain/locale_repository.dart';

class LocaleCubit extends Cubit<Locale> {
  final LocaleRepository _localeRepository;
  LocaleCubit(this._localeRepository) : super(Locale('en'));
  Future<void> loadLocale() async {
    final saved = await _localeRepository.getSavedLocale();
    emit(saved);
  }

  Future<void> changeLocale(Locale locale) async {
    await _localeRepository.saveLocale(locale);
    emit(locale);
  }
}
