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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(title ?? ''),
        contentTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        content: Text(content ?? ''),
        actions: actions,
      ),
    );
  }
}
