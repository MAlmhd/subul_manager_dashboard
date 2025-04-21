
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 110.w,
          height: 120.h,
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(width: 1.5, color: AppColors.goldenYellow),
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: TextField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(border: InputBorder.none),
            maxLines: 4,
          ),
        ),
        Positioned(
          top: 40.h,
          left: 35.w,
          child: Text(
            label,
            textDirection: TextDirection.rtl,
            style: Styles.textStyle6Sp.copyWith(
              color: AppColors.black.withValues(alpha: 0.4),
            ),
          ),
        ),
      ],
    );
  }
}
