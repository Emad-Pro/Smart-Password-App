import 'package:flutter/material.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

class GenratorPasswordsFooterWidget extends StatelessWidget {
  const GenratorPasswordsFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Developed by".tr(context),
              style: const TextStyle(fontWeight: FontWeight.w100),
            ),
            const Text(
              "  @Emad-Younis",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "With".tr(context),
                style: const TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            const Icon(
              Icons.favorite,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
