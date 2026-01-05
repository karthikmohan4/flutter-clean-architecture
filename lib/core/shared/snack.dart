import 'package:flutter/material.dart';

class Snack {
  static void  pop(
    BuildContext context,
    String message,
  ) {

     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), showCloseIcon: true));
  }
}
