import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_password/feture/genrator/presentation/view_model/cubit/generator_cubit.dart';
import 'package:smart_password/feture/settings/view_model/cubit/settings_cubit.dart';

import 'core/AppLocalizations/app_localizations.dart';
import 'core/get_It/service_locator.dart';
import 'core/sharedPreferences/cacheHelper.dart';
import 'core/theme/theme.dart';
import 'feture/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ServiceLocator().init();
  await ThemeService.themeInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<SettingsCubit>()..getSavedLanguage()),
          BlocProvider(create: (context) => GeneratorCubit(getIt())),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            context.watch<SettingsCubit>().state;
            return MaterialApp(
              locale: BlocProvider.of<SettingsCubit>(context).locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              title: 'Smart Password',
              theme: ThemeService().lightMode(context),
              darkTheme: ThemeService().darkMode(context),
              themeMode:
                  ThemeService.darkModeValue ? ThemeMode.dark : ThemeMode.light,
              // ignore: prefer_const_constructors
              home: HomeScreen(),
            );
          },
        ));
  }
}
