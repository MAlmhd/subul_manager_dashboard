import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';

class TimeDateBooking extends StatelessWidget {
  const TimeDateBooking({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 124.w,
      height: 500.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('تاريخ ووقت الحجز', style: Styles.textStyle5Sp),
          SizedBox(height: size.height / 50),
          Row(
            children: [
              SizedBox(width: size.width / 20),
              Container(
                width: 30.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '14/8/2022',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 40),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '08',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 150),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '10',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 150),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '55',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 20),
            ],
          ),
          SizedBox(height: size.height / 50),
          Text('تاريخ ووقت الوصول للمخزن', style: Styles.textStyle5Sp),
          SizedBox(height: size.height / 50),
          Row(
            children: [
              SizedBox(width: size.width / 20),
              Container(
                width: 30.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '14/8/2022',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 40),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '08',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 150),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '10',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 150),
              Container(
                width: 10.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.deepPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '55',
                    style: Styles.textStyle4Sp.copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              SizedBox(width: size.width / 20),
            ],
          ),
          SizedBox(height: size.height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'عدد الطرود التي وصلت',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '   : ',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
              Text(
                '5',
                style: Styles.textStyle5Sp,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          SizedBox(height: size.height / 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'اسم مستلم المخزن',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '   : ',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
              ),
              Text(
                'محمد',
                style: Styles.textStyle5Sp,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          SizedBox(height: size.height / 50),
          Text(
            'رفع ملف إيصال الاستلام من المطار',
            style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          SizedBox(height: size.height / 50),
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
          SizedBox(height: size.height / 50),
          CustomOkButton(onTap: () {}, color: AppColors.deepPurple, label: 'موافق',),
        ],
      ),
    );
  }
}
