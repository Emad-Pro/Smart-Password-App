import 'package:flutter/material.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

class GeneratorPasswordHeaderBody extends StatelessWidget {
  const GeneratorPasswordHeaderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const Icon(
              Icons.lock,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5.0),
              child: Text(
                "Password Generator".tr(context),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.replay_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
            )
          ],
        ),
      ),
    );
  }
}
