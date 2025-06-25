import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 20.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.deepPurple, width: 2),
      ),
      child: Center(
        child: Container(
          width: 4.w,
          height: 10.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Color(0xFF00D27A) : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
