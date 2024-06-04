import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/AppLocalizations/app_localizations.dart';
import 'package:smart_password/core/enum/request_state.dart';
import 'package:smart_password/feture/passwords/presentation/view_model/cubit/passwords_saved_cubit.dart';
import 'widget/build_list_view_item.dart';

class PasswordsSavedScreen extends StatelessWidget {
  const PasswordsSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PasswordsSavedCubit()..getPasswordsData(),
        child: BlocBuilder<PasswordsSavedCubit, PasswordsSavedState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return const CircularProgressIndicator();
              case RequestState.success:
                final passwordsSavedCubit = context.read<PasswordsSavedCubit>();
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text("Saved passwords".tr(context)),
                      actions: [
                        IconButton(
                            onPressed: () {
                              passwordsSavedCubit.clearAllPasswords();
                            },
                            icon: const Icon(Icons.clear_all))
                      ],
                    ),
                    SliverList.builder(
                        itemCount: state.passwordsModel!.length,
                        itemBuilder: (context, index) => BuildListViewItem(
                              passwordsGenerationModel:
                                  state.passwordsModel![index],
                            ))
                  ],
                );
              case RequestState.erorr:
                return const Text("some Erorr");
            }
          },
        ),
      ),
    );
  }
}
