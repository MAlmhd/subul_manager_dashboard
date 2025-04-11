import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/custom_switch_label.dart';

class EnterDetailsOfShipments extends StatelessWidget {
  const EnterDetailsOfShipments({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      // width: 120.w,
      // height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
        color: AppColors.lightGray2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تفاصيل الطرد',
            style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          SizedBox(height: size.height / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSwitchLabel(label: 'تالف'),
              CustomSwitchLabel(label: 'تم فتحه'),
            ],
          ),
          SizedBox(height: size.height / 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(
              child: Text(
                'الوزن الفعلي الجديد',
                style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(height: size.height / 60),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.deepPurple.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(
              child: Text(
                'الوزن الفعلي السابق:7878 Kg',
                style: Styles.textStyle3Sp.copyWith(color: AppColors.white),
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(height: size.height / 40),
          Text(
            'رفع صورة للميزان',
            style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
          ),
          SizedBox(height: size.height / 40),
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
          SizedBox(height: size.height / 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              children: [
                Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.white),
                SizedBox(width: size.width / 80),
                Text(
                  'حالة الطرد',
                  style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 40),
          Text(
            'إضافة بعض الملاحظات',
            style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
          ),
          SizedBox(height: size.height / 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(width: 2, color: AppColors.deepPurple),
            ),
            child: SizedBox(
              width: 40.w,
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(height: size.height / 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Center(
              child: Text(
                'موافق',
                style: Styles.textStyle4Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
