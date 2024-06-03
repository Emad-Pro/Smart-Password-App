import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/widget/custom_listTile_widget.dart';
import '../../../../settings/view_model/cubit/settings_cubit.dart';

class DrawerProfileTileWidget extends StatelessWidget {
  const DrawerProfileTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: CustomListTileWidget(
        icon: CupertinoIcons.profile_circled,
        onTap: () {},
        title: "Profile".tr(context),
        subtitle: "Profile Details".tr(context),
        color: Colors.blue[900],
        widget:
            BlocProvider.of<SettingsCubit>(context).locale!.languageCode == "en"
                ? const Icon(Icons.keyboard_arrow_right)
                : const Icon(Icons.keyboard_arrow_left),
      ),
    );
  }
}
