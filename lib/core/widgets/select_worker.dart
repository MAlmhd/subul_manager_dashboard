import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class SelectWorker extends StatelessWidget {
  const SelectWorker({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
          width: 8.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: AppColors.goldenYellow,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Container(
              width: 4.5.w,
              height: 16.5.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        )
        : Container(
          width: 8.w,
          height: 30.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.deepPurple, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
        );
  }
}
