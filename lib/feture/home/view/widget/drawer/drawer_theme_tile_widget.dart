import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/get_It/service_locator.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/widget/custom_listTile_widget.dart';
import '../../../../settings/view_model/cubit/settings_cubit.dart';

class DrawerThemeTileWidget extends StatelessWidget {
  const DrawerThemeTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
        child: CustomListTileWidget(
      icon: CupertinoIcons.moon_fill,
      color: Colors.orange[900],
      title: "Theme Mode".tr(context),
      subtitle: "You can switch between light mode and dark mode".tr(context),
      widget: Switch(
          value: ThemeService.darkModeValue,
          onChanged: (value) {
            getIt<SettingsCubit>().changeThemeMode();
          }),
    ));
  }
}
