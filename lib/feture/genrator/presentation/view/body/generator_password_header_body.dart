import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import 'package:smart_password/core/enum/request_state.dart';
import 'package:smart_password/feture/genrator/presentation/view_model/cubit/generator_cubit.dart';

class GeneratorPasswordHeaderBody extends StatelessWidget {
  const GeneratorPasswordHeaderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GeneratorCubit, GeneratorState>(
        builder: (context, state) {
          final generatorCubit = context.read<GeneratorCubit>();
          return Container(
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
                if (state.requestPasswordState != RequestState.loading)
                  IconButton(
                    onPressed: () {
                      Share.share("Smart Password".tr(context),
                          subject: generatorCubit
                              .passwordTextEditingController.text);
                    },
                    icon: const Icon(Icons.share),
                  ),
                IconButton(
                  onPressed: () {
                    generatorCubit.restorAllData();
                  },
                  icon: const Icon(Icons.replay_outlined),
                ),
                if (!kIsWeb)
                  if (state.requestPasswordState != RequestState.loading)
                    IconButton(
                      onPressed: () {
                        generatorCubit.savedPasswodToDatabase(
                            state.passwordResultModel!, context);
                      },
                      icon: const Icon(Icons.save),
                    )
              ],
            ),
          );
        },
      ),
    );
  }
}
