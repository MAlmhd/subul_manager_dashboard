import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key, required this.label, required this.keyboardType});
  final String label;
 final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          keyboardType: keyboardType,
          textAlign: TextAlign.right,

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 5.w,
            ),
            label: Text(
              label,
              style: Styles.textStyle3Sp.copyWith(color: AppColors.deepGray),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              borderSide: BorderSide(color: AppColors.deepPurple, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              borderSide: BorderSide(color: AppColors.deepPurple, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(cornerRadius),
              borderSide: BorderSide(color: AppColors.deepPurple, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
