
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomTextInputFieldWithoutIconInWarehouseSection
    extends StatelessWidget {
  const CustomTextInputFieldWithoutIconInWarehouseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 50.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: TextField(
          // textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
