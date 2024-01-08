import 'package:flutter/material.dart';

class AppDialog {
  AppDialog._();
  static void dialog(
    BuildContext context, {
    String? title,
    String? content,
    List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(title ?? ''),
          content: Text(content ?? ''),
          actions: actions),
    );
  }
}