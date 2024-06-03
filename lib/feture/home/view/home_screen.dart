import 'package:flutter/material.dart';

import 'widget/drawer_home_screen.dart';

import '../../genrator/presentation/view/genrator_password_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: DrawerHomeScreen(),
      body: GenratorPasswordBody(),
    );
  }
}
