import 'package:flutter/material.dart';

class CustomChackButtonWidget extends StatelessWidget {
  const CustomChackButtonWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});
  final String title;
  final void Function(bool?)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.teal,
          )
        ],
      ),
    );
  }
}
