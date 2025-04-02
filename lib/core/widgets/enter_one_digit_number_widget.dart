import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class EnterOneDigitNumberWidget extends StatelessWidget {
  const EnterOneDigitNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 20.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 1,
          style: Styles.textStyle20.copyWith(fontSize: 6.sp),
        ),
      ),
    );
  }
}
