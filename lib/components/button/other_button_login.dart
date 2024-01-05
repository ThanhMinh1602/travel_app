import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/gen/assets.gen.dart';

class OtherButtonLogin extends StatelessWidget {
  const OtherButtonLogin({
    super.key,
    this.color = AppColor.white,
    this.textColor = AppColor.grey626262,
    required this.text,
    this.onTap,
    required this.icon,
  });

  final Color? color;
  final Color textColor;
  final String text;
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0.r),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.0.r),
        splashColor: AppColor.loginFormColor.withOpacity(0.5),
        child: Ink(
          padding: EdgeInsets.only(left: 14.w),
          height: 46.0.h,
          width: 266.0.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24.0.w,
                color: textColor,
              ),
              SizedBox(width: 17.0.w),
              Text(
                text,
                style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
