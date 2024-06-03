import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/widget/custom_listTile_widget.dart';
import '../../../../settings/view_model/cubit/settings_cubit.dart';

class DrawerAboutTileWidget extends StatelessWidget {
  const DrawerAboutTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: CustomListTileWidget(
        widget:
            BlocProvider.of<SettingsCubit>(context).locale!.languageCode == "en"
                ? const Icon(Icons.keyboard_arrow_right)
                : const Icon(Icons.keyboard_arrow_left),
        icon: CupertinoIcons.info_circle_fill,
        color: Colors.purple[900],
        onTap: () {},
        title: "About".tr(context),
        subtitle: "Information about the developer".tr(context),
      ),
    );
  }
}
