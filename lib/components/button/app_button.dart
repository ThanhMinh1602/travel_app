import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.color = AppColor.primaryColor,
    this.borderColor = AppColor.primaryColor,
    this.textColor = AppColor.white,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });
  const AppButton.outline({
    super.key,
    this.color = AppColor.white,
    this.borderColor = AppColor.primaryColor,
    this.textColor = AppColor.primaryColor,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });
  final Color? color;
  final Color borderColor;
  final Color textColor;
  final String text;
  final void Function()? onTap;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0.r),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: isLoading == true ? false : true,
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.0.r),
        splashColor: AppColor.loginFormColor.withOpacity(0.5),
        child: Ink(
          height: 61.0.h,
          width: 158.0.w,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Center(
            child: isLoading == true
                ? SizedBox(
                    width: 30.0.w,
                    height: 30.0.h,
                    child: const CircularProgressIndicator(
                      color: AppColor.white,
                    ),
                  )
                : Text(
                    text,
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
          ),
        ),
      ),
    );
  }
}
