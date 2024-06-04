import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_password/core/enum/request_state.dart';
import 'package:smart_password/feture/passwords/presentation/view_model/cubit/passwords_saved_cubit.dart';

import '../../../../core/database/model/password_generation_model.dart';

class PasswordsSavedScreen extends StatelessWidget {
  const PasswordsSavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PasswordsSavedCubit()..getPasswordsData(),
        child: BlocBuilder<PasswordsSavedCubit, PasswordsSavedState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return CircularProgressIndicator();
              case RequestState.success:
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text("كلمات السر المحفوظة"),
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
                return Text("some Erorr");
            }
          },
        ),
      ),
    );
  }
}

class BuildListViewItem extends StatelessWidget {
  const BuildListViewItem({super.key, required this.passwordsGenerationModel});
  final PasswordsGenerationModel passwordsGenerationModel;
  @override
  Widget build(BuildContext context) {
    final datetime = passwordsGenerationModel.dateTime!.toLocal();
    final time = "${datetime.hour} : ${datetime.minute}";
    final date = "${datetime.year} / ${datetime.month} / ${datetime.day}";
    return ListTile(
      title: Text(passwordsGenerationModel.passwordText!),
      subtitle: Text(date),
      leading: Container(
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(50)),
        margin: EdgeInsets.all(5),
        width: 60,
        height: 60,
        child: Center(child: Text(time)),
      ),
    );
  }
}
