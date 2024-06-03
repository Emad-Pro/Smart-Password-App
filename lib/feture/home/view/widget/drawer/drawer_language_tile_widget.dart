import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/widget/custom_listTile_widget.dart';
import '../../../../settings/view_model/cubit/settings_cubit.dart';

class DrawerLanguageTileWidget extends StatelessWidget {
  const DrawerLanguageTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: CustomListTileWidget(
        icon: Icons.language,
        title: "language".tr(context),
        subtitle: "You can switch between Arabic and English".tr(context),
        color: Colors.green[900],
        widget: SizedBox(
          height: 200,
          width: 100,
          child: DropdownButton<String>(
              isExpanded: true,
              isDense: false,
              value: BlocProvider.of<SettingsCubit>(context)
                          .locale!
                          .languageCode ==
                      "en"
                  ? "English"
                  : "Arabic",
              items: ["English", "Arabic"].map((String items) {
                return DropdownMenuItem<String>(
                  value: items,
                  child: Text(items.tr(context)),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue == "English") {
                  BlocProvider.of<SettingsCubit>(context).changeLanguage("en");
                } else if (newValue == "Arabic") {
                  BlocProvider.of<SettingsCubit>(context).changeLanguage("ar");
                }
              }),
        ),
      ),
    );
  }
}
