import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';
import 'package:smart_password/feture/genrator/presentation/view_model/cubit/generator_cubit.dart';

import '../../../../../core/enum/request_state.dart';
import '../../../../../core/method/check_password_color.dart';
import '../../../../../core/method/show_snake_bar.dart';
import '../../../../../core/method/value_strength_password.dart';

class GenratorPasswordTextFormFiled extends StatelessWidget {
  const GenratorPasswordTextFormFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GeneratorCubit, GeneratorState>(
        builder: (context, state) {
          final generatorCubit = context.read<GeneratorCubit>();
          //    final passowrdCheckValue = state.passwordResultModel;
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                TextFormField(
                  readOnly: true,
                  maxLines: 3,
                  controller: generatorCubit.passwordTextEditingController,
                  decoration: InputDecoration(
                    suffixIcon: state.requestPasswordState ==
                            RequestState.success
                        ? MaterialButton(
                            minWidth: 0,
                            height: 0,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                      text: generatorCubit
                                          .passwordTextEditingController.text))
                                  .then((onValue) {
                                showInSnackBar(
                                    "Copy completed successfully".tr(context),
                                    context);
                              });
                            },
                            child: const Icon(
                              Icons.copy,
                            ))
                        : null,
                    hintText: "Create a strong password".tr(context),
                    border: InputBorder.none,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.info_outline),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsetsDirectional.only(start: 5),
                        child: Text(
                          state.requestPasswordState != RequestState.loading
                              ? valueStrengthPassword(state
                                      .passwordResultModel!.passowrdCheckValue!)
                                  .tr(context)
                              : "Remember: A strong password is an essential step to protecting your personal data and online accounts."
                                  .tr(context),
                          style: TextStyle(
                              color: state.requestPasswordState !=
                                      RequestState.loading
                                  ? checkPasswordColor(state
                                      .passwordResultModel!.passowrdCheckValue!)
                                  : null),
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
