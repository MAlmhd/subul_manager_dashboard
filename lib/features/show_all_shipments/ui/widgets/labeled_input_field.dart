import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class LabeledInputField extends StatelessWidget {
  const LabeledInputField({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 4.w),
        child: TextField(
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,

            hintStyle: Styles.textStyle4Sp.copyWith(
              color: AppColors.black.withValues(alpha: 0.4),
            ),
          ),
        ),
      ),
    );
  }
}
