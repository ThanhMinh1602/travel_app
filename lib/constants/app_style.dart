import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';

class AppStyle {
  AppStyle._();
  static TextStyle titleLogin = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 50.sp,
    fontWeight: FontWeight.w500,
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.25),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ],
  );
  static TextStyle regular14 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle light20 = GoogleFonts.poppins(
    color: AppColor.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle light14 = GoogleFonts.poppins(
    color: AppColor.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle medium20 = GoogleFonts.poppins(
    color: AppColor.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
}
