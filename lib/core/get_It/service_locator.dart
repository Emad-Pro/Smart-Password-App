import 'package:get_it/get_it.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';
import 'package:smart_password/feture/genrator/data/repo/generator_repository.dart';

import '../../feture/settings/view_model/cubit/settings_cubit.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerFactory(() => LanguageCacheHelper());

    getIt.registerLazySingleton(() => SettingsCubit(getIt()));

    getIt.registerSingleton<GeneratorPasswordRepository>(
        GeneratorPasswordRepositoryImp());
  }
}
