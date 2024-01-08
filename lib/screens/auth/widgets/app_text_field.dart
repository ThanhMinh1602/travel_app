import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.text1,
      this.text2,
      this.controller,
      this.validator,
      this.obscureText = false});
  final String text1;
  final String? text2;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppStyle.regular14,
            children: [
              TextSpan(text: text1),
              TextSpan(text: text2),
            ],
          ),
        ),
        // Text('Email', style: AppStyle.regular14),
        SizedBox(height: 9.0.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 10.0.h,
            ),
            filled: true,
            fillColor: AppColor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide.none,
            ),
          ),
        )
      ],
    );
  }
}
