import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';

import '../../../../../core/database/model/password_generation_model.dart';
import '../../../../../core/method/check_password_color.dart';
import '../../../../../core/method/convert_date_time_to_string.dart';
import '../../../../../core/method/show_snake_bar.dart';
import '../../../../../core/method/value_strength_password.dart';
import '../../view_model/cubit/passwords_saved_cubit.dart';

class BuildListViewItem extends StatelessWidget {
  const BuildListViewItem({super.key, required this.passwordsGenerationModel});
  final PasswordsGenerationModel passwordsGenerationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(3),
      child: ListTile(
        trailing: IconButton(
            onPressed: () {
              context
                  .read<PasswordsSavedCubit>()
                  .deletePasswords(passwordsGenerationModel.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            )),
        leading: CircleAvatar(
          child: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(
                        text: passwordsGenerationModel.passwordText!))
                    .then((onValue) {
                  showInSnackBar(
                      "Copy completed successfully".tr(context), context);
                });
              },
              icon: Icon(
                Icons.copy,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              )),
        ),
        title: Text(
            "${"Password".tr(context)} : ${passwordsGenerationModel.passwordText!}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              convertDateTimeToString(passwordsGenerationModel.dateTime!),
            ),
            Text(
              valueStrengthPassword(passwordsGenerationModel.passwordStrength!)
                  .tr(context),
              style: TextStyle(
                  color: checkPasswordColor(
                      passwordsGenerationModel.passwordStrength!),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
