import 'package:flutter/material.dart';

void showInSnackBar(String value, context) {
  var snackBar = SnackBar(content: Text(value));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
