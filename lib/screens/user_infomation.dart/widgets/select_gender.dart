import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';

class GenderSelectWidget extends StatefulWidget {
  final void Function(String) onGenderSelected;

  const GenderSelectWidget({
    Key? key,
    required this.onGenderSelected,
  }) : super(key: key);

  @override
  State<GenderSelectWidget> createState() => _GenderSelectWidgetState();
}

class _GenderSelectWidgetState extends State<GenderSelectWidget> {
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGenderOption(GenderType.male, 'Male'),
        SizedBox(height: 10.0.w),
        _buildGenderOption(GenderType.female, 'Female'),
      ],
    );
  }

  Widget _buildGenderOption(GenderType gender, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
        widget.onGenderSelected(label);
      },
      child: Container(
        width: 94.0.w,
        height: 32.0.h,
        decoration: BoxDecoration(
          color: selectedGender == gender
              ? AppColor.blueBDBDBD
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 6.64.w),
            SvgPicture.asset(
              selectedGender == gender
                  ? Assets.icons.circleCheked
                  : Assets.icons.circleUnchecked,
              width: 16.0.w,
            ),
            SizedBox(width: 2.44.w),
            Text(label, style: AppStyle.light13_5),
          ],
        ),
      ),
    );
  }
}

enum GenderType {
  male,
  female,
}
