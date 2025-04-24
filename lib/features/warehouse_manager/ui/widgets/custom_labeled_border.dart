

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomLabeledBorder extends StatelessWidget {
  const CustomLabeledBorder({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.goldenYellow),
      ),
      child: Center(
        child: Text(
          label,
          textDirection: TextDirection.rtl,
          style: Styles.textStyle3Sp.copyWith(
            color: AppColors.black.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
