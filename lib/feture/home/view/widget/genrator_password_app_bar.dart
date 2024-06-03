import 'package:flutter/material.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

class GenratorPasswordAppBar extends StatelessWidget {
  const GenratorPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text("Smart Password".tr(context)),
      centerTitle: true,
    );
  }
}
