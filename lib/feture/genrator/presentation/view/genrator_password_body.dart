import 'package:flutter/material.dart';

import 'body/generator_password_header_body.dart';
import 'body/genrator_fassword_text_form_filed.dart';
import 'body/genrator_password_option_buttons.dart';
import 'body/genrator_passwords_footer_widget.dart';
import '../../../home/view/widget/genrator_password_app_bar.dart';

class GenratorPasswordBody extends StatelessWidget {
  const GenratorPasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        GenratorPasswordAppBar(),
        GeneratorPasswordHeaderBody(),
        GenratorPasswordTextFormFiled(),
        GenratorPasswordOptionButtons(),
        GenratorPasswordsFooterWidget()
      ],
    );
  }
}
