part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class ThemeSettingChangedLoadingState extends SettingsState {}

class ThemeSettingChangedSuccessState extends SettingsState {}

class AppSettingsChangeLanguageLoadingState extends SettingsState {}

class AppSettingsChangeLanguageSuccessState extends SettingsState {}
