import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';

class TvAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TvAppBar({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 37.0.w, bottom: 14.0.h, top: 10.h),
            child: Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    Assets.icons.logoSvg,
                    // ignore: deprecated_member_use
                    color: AppColor.black,
                    width: 33.0.w,
                  ),
                ),
                SizedBox(width: 10.w),
                Hero(
                  tag: 'title',
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Trave',
                        style: GoogleFonts.poppins(
                          color: AppColor.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'ally',
                        style: GoogleFonts.poppins(
                          color: AppColor.primaryColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Text(title ?? '', style: AppStyle.light20),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 123.h);
}
