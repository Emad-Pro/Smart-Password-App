import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/AppLocalizations/app_localizations.dart';
import '../../../../../core/theme/theme.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.languageCacheHelper) : super(SettingsInitial());

  final LanguageCacheHelper languageCacheHelper;
  Locale? locale = const Locale("en");

  changeThemeMode() async {
    emit(ThemeSettingChangedLoadingState());
    await ThemeService.changeDarkMode();
    emit(ThemeSettingChangedSuccessState());
  }

  Future<void> getSavedLanguage() async {
    emit(AppSettingsChangeLanguageLoadingState());
    final String cacheLanguageCode =
        await languageCacheHelper.getCacheLanguageCode();

    locale = Locale(cacheLanguageCode);
    Intl.defaultLocale = locale!.languageCode;
    emit(AppSettingsChangeLanguageSuccessState());
  }

  Future<void> changeLanguage(String languageCode) async {
    emit(AppSettingsChangeLanguageLoadingState());
    await languageCacheHelper.setCacheLanguageCode(languageCode);

    locale = Locale(languageCode);
    Intl.defaultLocale = locale!.languageCode;
    emit(AppSettingsChangeLanguageSuccessState());
  }
}
