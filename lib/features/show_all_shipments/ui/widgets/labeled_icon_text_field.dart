

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class LabeledIconTextField extends StatelessWidget {
  const LabeledIconTextField({
    super.key,
    required this.svgPicture,
    required this.hintText,
  });

  final SvgPicture svgPicture;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: TextField(
        textAlign: TextAlign.right,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: Styles.textStyle4Sp.copyWith(
            color: AppColors.black.withValues(alpha: 0.4),
          ),
          contentPadding: EdgeInsets.all(16.0),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Container(
              width: 40,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.goldenYellow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: svgPicture),
              ),
            ),
          ),
        ),

        textDirection: TextDirection.rtl,
      ),
    );
  }
}