import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/widget/custom_listTile_widget.dart';
import '../../../../passwords/presentation/view/passwords_screen.dart';
import '../../../../settings/view_model/cubit/settings_cubit.dart';

class DrawerSavedPasswordsTileWidget extends StatelessWidget {
  const DrawerSavedPasswordsTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: CustomListTileWidget(
        icon: Icons.save,
        onTap: () => Navigator.push(
            context,
            // ignore: prefer_const_constructors,
            MaterialPageRoute(builder: (context) => PasswordsSavedScreen())),
        title: "Passwords Saved".tr(context),
        subtitle: "Here are all your saved passwords".tr(context),
        color: Colors.blue[900],
        widget:
            BlocProvider.of<SettingsCubit>(context).locale!.languageCode == "en"
                ? const Icon(Icons.keyboard_arrow_right)
                : const Icon(Icons.keyboard_arrow_left),
      ),
    );
  }
}
