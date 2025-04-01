import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({super.key, required this.onTap, required this.text, required this.isSelected});
  final void Function() onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 65.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.deepPurple : AppColors.goldenYellow,
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle20.copyWith(fontSize: 5.sp,color: isSelected ? AppColors.white : AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
