import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';

class ShowPickupTime extends StatelessWidget {
  const ShowPickupTime({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: 80.w,
            height: 370.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(color: AppColors.goldenYellow, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'وقت الاستلام',
                  style: Styles.textStyle6Sp,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Icon(
                  Icons.watch_later_outlined,
                  color: AppColors.deepPurple,
                  size: 18.w,
                ),
                Container(
                  width: 60.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: AppColors.goldenYellow),
                  ),
                  child: Center(
                    child: Text(
                      'من الساعة 8 صباحاً وحتى 10 المساء',
                      style: Styles.textStyle3Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Text(
                  'سيستلم المندوب الشحنة خلال الأوقات المحددة أعلاه',
                  style: Styles.textStyle4Sp,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
                CustomOkButton(
                  onTap: onTap,
                  color: AppColors.deepPurple,
                  label: 'موافق',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
