import 'package:flutter/material.dart';

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
