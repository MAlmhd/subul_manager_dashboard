import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';

class ThanksWidget extends StatelessWidget {
  const ThanksWidget({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: 80.w,
            height: 390.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(color: AppColors.goldenYellow, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'شكرًا لك',
                  style: Styles.textStyle6Sp,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                Image.asset(AssetsData.smallCar, width: 40.w),

                Text(
                  'تم تأكيد عملية جدولة الشحنة يمكنك في أي وقت التعديل أو الإلغاء',
                  style: Styles.textStyle4Sp,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
                CustomOkButton(onTap: onTap, color: AppColors.deepPurple, label: 'موافق',),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
