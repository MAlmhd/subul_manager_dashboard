import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.keyboardType,
    this.securePassword = false,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String label;
  final TextInputType keyboardType;
  final bool securePassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: securePassword,
          textAlign: TextAlign.right,
          validator: validator ?? (value) {
            if (value == null || value.trim().isEmpty) {
              return 'يرجى إدخال $label'; // Arabic: Please enter $label
            }
            return null;
          },
          onChanged: onChanged,
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
