import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/widgets/tv_appbar.dart';

class UpdateInfUser extends StatefulWidget {
  const UpdateInfUser({Key? key}) : super(key: key);

  @override
  State<UpdateInfUser> createState() => _UpdateInfUserState();
}

class _UpdateInfUserState extends State<UpdateInfUser> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Số lượng tab
      child: Scaffold(
        appBar: const TvAppBar(),
        body: Column(
          children: [
            dotPageSlide(),
            SizedBox(height: 34.0.h),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(Assets.icons.ionLanguageSvg,
                          width: 50.0.w),
                      Text('Select a languages you can speak',
                          style: AppStyle.light20),
                      SizedBox(height: 40.0.h), 
                    ],
                  ),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.red)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SmoothPageIndicator dotPageSlide() {
    return SmoothPageIndicator(
        controller: controller,
        count: 4,
        axisDirection: Axis.horizontal,
        effect: SlideEffect(
          dotHeight: 2.0.h,
          dotWidth: 104.w,
          dotColor: AppColor.black.withOpacity(0.5),
          spacing: 4.0.w,
          activeDotColor: AppColor.primaryColor,
          radius: 0.0,
        ));
  }
}
