import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';
import 'package:smart_password/feture/genrator/presentation/view_model/cubit/generator_cubit.dart';

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
          final passowrdCheckValue = state.passwordResultModel;
          if (state.passwordResultModel != null) {
            generatorCubit.passwordTextEditingController.text =
                state.passwordResultModel!.passwordValue!;
          }
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                TextFormField(
                  maxLines: 3,
                  controller: generatorCubit.passwordTextEditingController,
                  decoration: InputDecoration(
                    suffixIcon: MaterialButton(
                        minWidth: 0,
                        height: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(
                          Icons.copy,
                        )),
                    hintText: "Create a strong password".tr(context),
                    border: InputBorder.none,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.info_outline),
                    Container(
                        margin: const EdgeInsetsDirectional.only(start: 5),
                        child: Text(
                          passowrdCheckValue != null
                              ? valueTextPassword(state
                                      .passwordResultModel!.passowrdCheckValue!)
                                  .tr(context)
                              : "",
                          style: TextStyle(
                              color: passowrdCheckValue != null
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

String valueTextPassword(double strength) {
  return strength > 0.0 && strength <= 0.2
      ? "Weak password"
      : strength > 0.2 && strength <= 0.4
          ? "Medium strength password"
          : strength > 0.4 && strength <= 0.6
              ? "Strong password"
              : strength > 0.6 && strength <= 0.8
                  ? "A very strong password"
                  : "unbreakable password";
}

Color checkPasswordColor(double strength) {
  return strength > 0.0 && strength <= 0.2
      ? Colors.red
      : strength > 0.2 && strength <= 0.4
          ? Colors.yellow
          : strength > 0.4 && strength <= 0.6
              ? Colors.amber
              : strength > 0.6 && strength <= 0.8
                  ? Colors.orange
                  : Colors.green;
}
