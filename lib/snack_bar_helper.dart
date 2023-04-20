import 'package:flutter/material.dart';

class SnackBarHelper {
  static show({required BuildContext context, String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const StadiumBorder(),
        content: Text('$message'),
      ),
    );
  }
}
