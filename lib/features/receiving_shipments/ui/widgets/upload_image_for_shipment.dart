
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';

class UploadImageForShipment extends StatelessWidget {
  const UploadImageForShipment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 100.w,
      height: 400.h,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'رفع صور للطرد',
            style: Styles.textStyle4Sp.copyWith(color: AppColors.deepPurple),
          ),
          SizedBox(height: size.height / 30),
          Container(
            width: 50.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(color: AppColors.deepPurple, width: 1),
            ),
            child: Iconify(
              Bi.camera,
              color: AppColors.deepPurple.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(height: size.height / 25),
          SizedBox(
            width: 30.w,
            child: CustomOkButton(
              onTap: () {},
              color: AppColors.goldenYellow,
              label: 'حفظ',
            ),
          ),
        ],
      ),
    );
  }
}
