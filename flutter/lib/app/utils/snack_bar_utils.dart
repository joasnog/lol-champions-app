import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackBarError(BuildContext context, {String message = ''}) {
    final snackBar = SnackBar(content: Text(message), backgroundColor: Theme.of(context).errorColor);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
