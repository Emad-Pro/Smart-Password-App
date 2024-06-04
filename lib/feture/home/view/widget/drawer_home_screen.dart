import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer_about_tile_widget.dart';
import 'drawer/drawer_header_title_widget.dart';
import 'drawer/drawer_language_tile_widget.dart';
import 'drawer/drawer_saved_passwords_tile_widget.dart';
import 'drawer/drawer_theme_tile_widget.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeaderTitleWidget(),
          if (!kIsWeb) DrawerSavedPasswordsTileWidget(),
          DrawerThemeTileWidget(),
          DrawerLanguageTileWidget(),
          DrawerAboutTileWidget(),
        ],
      ),
    );
  }
}
