import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomTextFiledInWarehouseManager extends StatelessWidget {
  const CustomTextFiledInWarehouseManager({
    super.key,
    required this.iconInLeft,
    required this.icon,
    required this.hintText,
  });
  final bool iconInLeft;
  final Iconify icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconInLeft)
          Container(
            height: 50.h,
            width: 14.w,
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(child: icon),
          ),
        SizedBox(width: size.width / 100),
        Container(
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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: Styles.textStyle4Sp.copyWith(
                  color: AppColors.black.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: size.width / 100),
        if (!iconInLeft)
          Container(
            height: 50.h,
            width: 14.w,
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(child: icon),
          ),
      ],
    );
  }
}
