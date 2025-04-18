import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.hintText,
    this.icon,
    required this.svgPicture,
  });
  final String hintText;
  final Icon? icon;
  final SvgPicture svgPicture;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 140.w,
      height: 50.h,
      padding: EdgeInsets.only(right: 4.w, left: 7.w),
      decoration: BoxDecoration(
        color: AppColors.goldenYellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.deepGray, width: 1), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon ?? Container(),
          Row(
            children: [
              Text(
                hintText,
                style: Styles.textStyle3Sp.copyWith(
                  color: AppColors.black.withValues(alpha: 0.4),
                ),
              ),
              SizedBox(width: size.width / 100),
              svgPicture,
            ],
          ),
        ],
      ),
    );
  }
}
