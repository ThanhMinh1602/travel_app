import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/constants/app_color.dart';
import 'package:travel_app/constants/app_style.dart';
import 'package:travel_app/gen/assets.gen.dart';
import 'package:travel_app/models/language_and_interrestsmodel.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  bool isChoose = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isChoose = !isChoose),
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        decoration: BoxDecoration(
          color: AppColor.blueBDBDBD,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        child: Row(
          children: [
            isChoose == false
                ? SvgPicture.asset(Assets.icons.uncheckdIcSvg)
                : SvgPicture.asset(Assets.icons.checkedIcSvg),
            const SizedBox(width: 12.0),
            Text(dataLanguages[widget.index].title, style: AppStyle.light14)
          ],
        ),
      ),
    );
  }
}
