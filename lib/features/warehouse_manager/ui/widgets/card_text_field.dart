import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CardTextField extends StatelessWidget {
  const CardTextField({super.key, required this.svgPicture, required this.hintText});
  final SvgPicture svgPicture;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 70.w,
      height: 45.h,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3,
            // spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 55.w,
            child: TextField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintTextDirection: TextDirection.rtl,
                hintText: hintText,

                hintStyle: Styles.textStyle4Sp.copyWith(
                  color: AppColors.black.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
          SizedBox(width: size.width / 100),
          Flexible(child:svgPicture),
        ],
      ),
    );
  }
}
