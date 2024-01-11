import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/components/button/app_button.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/screens/auth/widgets/tv_appbar.dart';
import 'package:travel_app/screens/user_infomation.dart/bloc/user_infomation_bloc.dart';
import 'package:travel_app/screens/user_infomation.dart/widgets/input_infomation.dart';
import 'package:travel_app/screens/user_infomation.dart/widgets/select_gender.dart';

class EntersInformation extends StatefulWidget {
  const EntersInformation({Key? key}) : super(key: key);

  @override
  State<EntersInformation> createState() => _EntersInformationState();
}

class _EntersInformationState extends State<EntersInformation> {
  final PageController controller = PageController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String gender = '';
  String path = '';

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserInfomationBloc>(context);

    return BlocBuilder<UserInfomationBloc, UserInformationState>(
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
                      controller: controller,
                      onPageChanged: (value) =>
                          bloc.add(PageChanged(index: value)),
                      children: [
                        _buildWonderfulPage(bloc, state),
                        _buildYourResponsePage(state),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 74.0.h,
                left: 0,
                right: 0,
                child: Center(
                  child: _buildBottomButton(bloc, state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getAppBarTitle(UserInformationState state) {
    if (state is PageChangedState) {
      return (state.index == 1) ? 'Your response' : 'Wonderful';
    }
    return 'Wonderful';
  }

  Widget _buildWonderfulPage(
      UserInfomationBloc bloc, UserInformationState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          SvgPicture.asset(Assets.icons.genderIcSvg, width: 50.0.w),
          Text(
            'You’re about to start exploring, so\ntell about yourself!',
            style: AppStyle.light16,
            textAlign: TextAlign.center,
          ),
          _buildPageTitle('Select your Gender'),
          GenderSelectWidget(
              onGenderSelected: (p0) =>
                  bloc.add(SelectGenderEvent(gender: p0))),
          _buildPageTitle('Additional Information'),
          _buildInputInformation(
              nameController, 'Name', Icons.person_outline, 25.0.w),
          _buildSizedBox(10.0.h),
          _buildInputInformation(
              dobController, 'D.O.B', Icons.calendar_today_outlined, 20.0.w),
          _buildSizedBox(10.0.h),
          _buildInputInformation(locationController, 'Location',
              Icons.location_on_rounded, 25.0.w),
          _buildSizedBox(10.0.h),
          _buildPageTitle('Upload a profile picture'),
          _buildSizedBox(10.0.h),
          GestureDetector(
              onTap: () {
                bloc.add(ImagePickerEvent());
              },
              child: _buildUploadContainer()),
        ],
      ),
    );
  }

  Widget _buildYourResponsePage(UserInformationState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SvgPicture.asset(Assets.icons.bookIcSvg, width: 50.0.w),
          Text(
            'What we received from you',
            style: AppStyle.light16,
            textAlign: TextAlign.center,
          ),
          _buildSizedBox(27.0.h),
          _buildCircleAvatar(),
          _buildSizedBox(7.0.h),
          Text(nameController.text, style: AppStyle.regular16),
          Text(locationController.text, style: AppStyle.light13),
          _buildSizedBox(24.0.h),
          _buildFormShowInf('Gender', gender),
          _buildSizedBox(10.0.h),
          _buildFormShowInf('D.O.B', dobController.text),
          _buildSizedBox(10.0.h),
        ],
      ),
    );
  }

  Widget _buildFormShowInf(String prefixText, String textContent) {
    return InputInformation(
      readOnly: true,
      controller: TextEditingController(text: textContent),
      prefixIcon: SizedBox(
        width: 100.0.w,
        child: Padding(
          padding: const EdgeInsets.only(left: 7.0),
          child: Text(
            prefixText,
            style: AppStyle.light15
                .copyWith(color: AppColor.black.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }

  Widget _buildPageTitle(String text) {
    return Container(
      margin: EdgeInsets.only(top: 30.0.h, bottom: 15.0.h),
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      decoration: BoxDecoration(
        color: AppColor.blueBDBDBD,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Text(text, style: AppStyle.light15),
    );
  }

  Widget _buildInputInformation(TextEditingController controller,
      String hintText, IconData prefixIcon, double iconSize) {
    return InputInformation(
      controller: controller,
      hintText: hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Icon(prefixIcon,
            size: iconSize, color: AppColor.black.withOpacity(0.5)),
      ),
    );
  }

  Widget _buildSizedBox(double height) {
    return SizedBox(height: height);
  }

  Widget _buildUploadContainer() {
    return BlocBuilder<UserInfomationBloc, UserInformationState>(
      builder: (context, state) {
        if (state is ImagePickerStateSuccess) {
          path = state.path;
          if (path.isNotEmpty) {
            return Image.file(File(path), height: 100.h);
          }
        }
        return Container(
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
              SizedBox(width: 6.0.w),
              Text('Upload',
                  style: AppStyle.regular15.copyWith(color: AppColor.black)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCircleAvatar() {
    return BlocBuilder<UserInfomationBloc, UserInformationState>(
      builder: (context, state) {
        if (state is ImagePickerStateSuccess) {
          path = state.path;
        }
        return CircleAvatar(
          radius: 86 / 2,
          backgroundImage: FileImage(File(path)),
        );
      },
    );
  }

  Widget _buildBottomButton(
      UserInfomationBloc bloc, UserInformationState state) {
    if (state is PageChangedState && state.index == 1) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton.outline(text: 'Edit'),
          SizedBox(width: 20.0),
          AppButton(text: 'Finish'),
        ],
      );
    }
    return AppButton(
      isRow: true,
      text: 'Next',
      onTap: () {
        controller.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
        if (state is SelectGenderState) {
          gender = state.gender;
        }
      },
    );
  }

  Widget _dotPageSlide() {
    return SmoothPageIndicator(
      controller: controller,
      count: 2,
      axisDirection: Axis.horizontal,
      effect: SlideEffect(
        dotHeight: 2.0.h,
        dotWidth: 220.w,
        dotColor: AppColor.black.withOpacity(0.5),
        spacing: 4.0.w,
        activeDotColor: AppColor.primaryColor,
        radius: 0.0,
      ),
    );
  }
}
