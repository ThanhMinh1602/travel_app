import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/models/language_and_interrestsmodel.dart';
import 'package:travel_app/screens/auth/widgets/tv_appbar.dart';
import 'package:travel_app/screens/user_infomation.dart/bloc/user_infomation_bloc.dart';
import 'package:travel_app/screens/user_infomation.dart/widgets/input_infomation.dart';

class EntersInformation extends StatefulWidget {
  const EntersInformation({Key? key}) : super(key: key);

  @override
  State<EntersInformation> createState() => _EntersInformationState();
}

class _EntersInformationState extends State<EntersInformation> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserInfomationBloc>(context);
    return BlocBuilder<UserInfomationBloc, UserInfomationState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: TvAppBar(title: _getAppBarTitle(state)),
          body: Stack(
            children: [
              Column(
                children: [
                  _dotPageSlide(),
                  SizedBox(height: 34.0.h),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller,
                      onPageChanged: (value) {
                        bloc.add(PageChanged(index: value));
                      },
                      children: [
                        _chooseLanguage(),
                        _yourInterests(),
                        _wonderful(),
                        _yourResponse(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 74.0.h,
                left: 0,
                right: 0,
                child: Center(child: _buildBottomButton(state)),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getAppBarTitle(UserInfomationState state) {
    if (state is PageChangedState) {
      switch (state.index) {
        case 0:
          return 'Choose a Language';
        case 1:
          return 'Your Interests';
        case 2:
          return 'Wonderful';
        case 3:
          return 'Your response';
      }
    }
    return 'Choose a Language';
  }

  Widget _chooseLanguage() {
    return Column(
      children: [
        SvgPicture.asset(Assets.icons.ionLanguageSvg, width: 50.0.w),
        Text('Select a languages you can speak', style: AppStyle.light20),
        SizedBox(height: 40.0.h),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 38.0.w),
            itemCount: dataLanguages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                            ? SvgPicture.asset(Assets.icons.checkedIcSvg)
                            : SvgPicture.asset(Assets.icons.uncheckdIcSvg)),
                    const SizedBox(width: 12.0),
                    Text(dataLanguages[index].title, style: AppStyle.light14)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _yourInterests() {
    return Column(
      children: [
        SvgPicture.asset(Assets.icons.heartSvg, width: 50.0.w),
        Text(
          'Select things you’re interested in &\nwe’ll help you connect with people sharing\nsame interests as you',
          style: AppStyle.light16,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.0.h),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 38.0.w),
            itemCount: dataIntersets.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 19.0.h,
              crossAxisSpacing: 16.0.w,
              mainAxisExtent: 39.0.h,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 16.0),
                decoration: BoxDecoration(
                  color: AppColor.blueBDBDBD,
                  borderRadius: BorderRadius.circular(5.0.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        child: dataLanguages[index].checked
                            ? SvgPicture.asset(Assets.icons.checkedIcSvg)
                            : SvgPicture.asset(Assets.icons.uncheckdIcSvg)),
                    const SizedBox(width: 15.0),
                    Text(dataIntersets[index].title, style: AppStyle.light14)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _wonderful() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            SvgPicture.asset(Assets.icons.genderIcSvg, width: 50.0.w),
            Text(
              'You’re about to start exploring, so\ntell about yourself!',
              style: AppStyle.light16,
              textAlign: TextAlign.center,
            ),
            _title(text: 'Select your Gender'),
            _genderSelect(text: 'Male', isSelect: true),
            _genderSelect(text: 'female'),
            _title(text: 'Additional Information'),
            InputInformation(
              hintText: 'Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.person_outline,
                  size: 25.0.w,
                  color: AppColor.black.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 10.0.h),
            InputInformation(
              hintText: 'D.O.B',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 20.0.w,
                  color: AppColor.black.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 10.0.h),
            InputInformation(
              hintText: 'Location',
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.location_on_rounded,
                  size: 25.0.w,
                  color: AppColor.black.withOpacity(0.5),
                ),
              ),
            ),
            SizedBox(height: 10.0.h),
            _title(text: 'Upload a propile picture'),
            SizedBox(height: 10.0.h),
            Container(
              width: 149.0.w,
              height: 39.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0.r),
                border: Border.all(color: AppColor.blueBDBDBD, width: 2.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.featherUpload),
                  SizedBox(
                    width: 6.0.w,
                  ),
                  Text(
                    'Upload',
                    style: AppStyle.regular15.copyWith(
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _yourResponse() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SvgPicture.asset(Assets.icons.bookIcSvg, width: 50.0.w),
          Text(
            'What we recieved from you',
            style: AppStyle.light16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 27.0.h),
          const CircleAvatar(
            radius: 86 / 2,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2020/05/24/04/17/husky-5212365_1280.jpg'),
          ),
          SizedBox(height: 7.0.h),
          Text('Nguyen Thanh Minh', style: AppStyle.regular16),
          Text('Quang Nam, Viet Nam', style: AppStyle.light13),
          SizedBox(height: 24.0.h),
          _formShowInf(prefixText: 'Gender', textContent: 'Male'),
          SizedBox(height: 10.0.h),
          _formShowInf(prefixText: 'D.O.B', textContent: '16/02/2001'),
          SizedBox(height: 10.0.h),
          _formShowInf(
              prefixText: 'Language', textContent: 'English, Viet Nam'),
          SizedBox(height: 10.0.h),
          _formShowInf(
              prefixText: 'Interests',
              textContent: 'adventure, beach, mountain'),
        ],
      ),
    );
  }

  InputInformation _formShowInf({String? textContent, String? prefixText}) {
    return InputInformation(
        readOnly: true,
        textContent: textContent,
        prefixIcon: SizedBox(
          width: 100.0.w,
          child: Padding(
            padding: const EdgeInsets.only(left: 7.0),
            child: Text(
              prefixText ?? '',
              style: AppStyle.light15
                  .copyWith(color: AppColor.black.withOpacity(0.5)),
            ),
          ),
        ));
  }

  Widget _buildBottomButton(UserInfomationState state) {
    if (state is PageChangedState) {
      if (state.index == 3) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.outline(text: 'Edit'),
            SizedBox(width: 20.0),
            AppButton(text: 'Finish'),
          ],
        );
      }
    }
    return AppButton(
      isRow: true,
      text: 'Next',
      onTap: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      },
    );
  }

  Widget _dotPageSlide() {
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
      ),
    );
  }

  Widget _title({String? text}) {
    return Container(
      margin: EdgeInsets.only(top: 30.0.h, bottom: 15.0.h),
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      decoration: BoxDecoration(
          color: AppColor.blueBDBDBD,
          borderRadius: BorderRadius.circular(10.0.r)),
      child: Text(text ?? '', style: AppStyle.light15),
    );
  }

  Widget _genderSelect({String? text, bool isSelect = false}) {
    return Container(
      width: 94.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
          color: isSelect == true ? AppColor.blueBDBDBD : Colors.transparent,
          borderRadius: BorderRadius.circular(5.0.r)),
      child: Row(
        children: [
          SizedBox(width: 6.64.w),
          SvgPicture.asset(
              isSelect == true
                  ? Assets.icons.circleCheked
                  : Assets.icons.circleUnchecked,
              width: 16.0.w),
          SizedBox(width: 2.44.w),
          Text(text ?? '', style: AppStyle.light13_5),
        ],
      ),
    );
  }
}
