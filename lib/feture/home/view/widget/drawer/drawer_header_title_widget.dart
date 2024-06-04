import 'package:flutter/material.dart';

class DrawerHeaderTitleWidget extends StatelessWidget {
  const DrawerHeaderTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
        child: Icon(
      Icons.lock,
      size: 45,
    ));
  }
}
