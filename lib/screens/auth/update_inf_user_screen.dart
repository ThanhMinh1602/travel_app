import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/models/language_and_interrestsmodel.dart';
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
        body: Stack(
          children: [
            Column(
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
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 38.0.w),
                              itemCount: dataLanguages.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 30.h,
                                crossAxisSpacing: 30.w,
                                mainAxisExtent: 30.0.h,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  decoration: BoxDecoration(
                                    color: AppColor.blueBDBDBD,
                                    borderRadius: BorderRadius.circular(5.0.r),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          child: dataLanguages[index].checked
                                              ? SvgPicture.asset(
                                                  Assets.icons.checkedIcSvg)
                                              : SvgPicture.asset(
                                                  Assets.icons.uncheckdIcSvg)),
                                      const SizedBox(width: 12.0),
                                      Text(dataLanguages[index].title,
                                          style: AppStyle.light14)
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
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
            Positioned(
                bottom: 74.0.h,
                left: 0,
                right: 0,
                child: Center(
                  child: AppButton(
                    isRow: true,
                    text: 'Next',
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                  ),
                ))
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
