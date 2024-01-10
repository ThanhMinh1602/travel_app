import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/constants/app_style.dart';

class InputInformation extends StatelessWidget {
  const InputInformation({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.textContent,
    this.readOnly = false,
  }) : super(key: key);

  final String? hintText;
  final Widget? prefixIcon;
  final String? textContent;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0.h,
      child: TextFormField(
        readOnly: readOnly,
        controller: TextEditingController(text: textContent),
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 255, 7, 7), width: 1),
          ),
          hintText: hintText,
          hintStyle: AppStyle.regular12,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
