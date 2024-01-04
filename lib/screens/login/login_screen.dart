import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(Assets.images.backgroundLogin.path,
              fit: BoxFit.cover),
        ),
        Positioned.fill(
            top: 51.h,
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/logApp.png',
                  width: 172.w,
                ),
                SizedBox(height: 15.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Trave',
                    style: GoogleFonts.poppins(
                      color: AppColor.white,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'ally',
                    style: GoogleFonts.poppins(
                      color: AppColor.primaryColor,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ])),
                SizedBox(height: 11.0.h),
                Container(
                  width: double.infinity,
                  height: 593.h,
                  decoration: BoxDecoration(
                      color: AppColor.loginFormColor.withOpacity(0.75)),
                )
              ],
            ))
      ],
    ));
  }
}
