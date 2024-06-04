import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';
import 'package:smart_password/feture/genrator/data/model/generator_password_model_get.dart';
import 'package:smart_password/feture/genrator/presentation/view_model/cubit/generator_cubit.dart';

import '../../../../../core/widget/custom_chack_button_widget.dart';

class GenratorPasswordOptionButtons extends StatelessWidget {
  const GenratorPasswordOptionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratorCubit, GeneratorState>(
      builder: (context, state) {
        final genratorCubit = context.read<GeneratorCubit>();
        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Password Length".tr(context)),
                    Text("  ${state.sliderValue}"),
                    const Spacer(),
                    MaterialButton(
                      color: Colors.teal,
                      onPressed: () {
                        genratorCubit.resetValue();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.replay),
                          Text("RESET".tr(context))
                        ],
                      ),
                    )
                  ],
                ),
                Slider(
                  value: state.sliderValue.toDouble(),
                  activeColor: Colors.teal,
                  secondaryActiveColor: Theme.of(context).colorScheme.surface,
                  onChanged: (value) {
                    genratorCubit.changeSliderValue(value.toInt());
                  },
                  min: 1,
                  max: 25,
                ),
                CustomChackButtonWidget(
                  onChanged: (value) {
                    genratorCubit.changeUpperCaseValue(value!);
                  },
                  title: "${"Uppercase".tr(context)} (A-Z)",
                  value: state.upperCaseValue,
                ),
                CustomChackButtonWidget(
                  onChanged: state.lowerCaseIsEnable
                      ? (value) {
                          genratorCubit.changelowerCaseValue(value!);
                        }
                      : null,
                  title: "${"Lowercase".tr(context)} (a-z)",
                  value: state.lowerCaseValue,
                ),
                CustomChackButtonWidget(
                  onChanged: (value) {
                    genratorCubit.changesymbolValue(value!);
                  },
                  title: "${"Symbol".tr(context)} (!@#\$)",
                  value: state.symbolValue,
                ),
                CustomChackButtonWidget(
                  onChanged: (value) {
                    genratorCubit.changesnumberValue(value!);
                  },
                  title: "${"Numbers".tr(context)} (0-9)",
                  value: state.numbersValue,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  width: double.infinity,
                  child: MaterialButton(
                    color: Colors.teal,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.replay,
                            size: 18,
                          ),
                          Container(
                              margin:
                                  const EdgeInsetsDirectional.only(start: 5),
                              child: Text("Generate Password".tr(context))),
                        ],
                      ),
                    ),
                    onPressed: () {
                      genratorCubit.genratorPasswordMethod(
                          GeneratorPasswordGetModel(
                              lowerCase: state.lowerCaseValue,
                              upperCase: state.upperCaseValue,
                              numbers: state.numbersValue,
                              symbol: state.symbolValue,
                              lengthPassword: state.sliderValue));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
