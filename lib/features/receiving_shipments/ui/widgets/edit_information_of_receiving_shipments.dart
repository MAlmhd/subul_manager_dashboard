
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';

class EditInformationOfReceivingShipments extends StatelessWidget {
  const EditInformationOfReceivingShipments({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 140.w,
      height: 700.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: SvgPicture.asset(AssetsData.boxPencilIcon)),
              SizedBox(width: size.width / 50),
              Flexible(
                child: Text(
                  'تعديل المعلومات',
                  style: Styles.textStyle5Sp.copyWith(
                    color: AppColors.deepPurple,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 40),
          Container(
            width: 70.w,
            height: 55.h,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.deepPurple,
                ),
                Spacer(),
                SizedBox(
                  width: 40.w,
                  child: TextField(
                    textDirection: TextDirection.rtl,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'أدخل اسم العميل أو رمزه.....',
                      hintStyle: Styles.textStyle3Sp.copyWith(
                        color: AppColors.black.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 30),
          Container(
            width: 70.w,
            height: 55.h,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: SvgPicture.asset(AssetsData.editIconPurple)),
                Spacer(),
                SizedBox(
                  width: 30.w,
                  child: Text(
                    'مبلغ الدفع عند التسليم :  65484',
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    style: Styles.textStyle3Sp.copyWith(
                      color: AppColors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 30),
          Container(
            width: 70.w,
            height: 200.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الملاحظات',
                  style: Styles.textStyle3Sp.copyWith(
                    color: AppColors.deepPurple,
                  ),
                  maxLines: 1,
                ),

                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: 0.4,
                        child: SvgPicture.asset(AssetsData.noteBackground),
                      ),
                    ),
                    TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(border: InputBorder.none),
                      maxLines: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 14.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.goldenYellow,
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
                child: Center(child: Icon(Icons.mail, color: AppColors.white)),
              ),
              SizedBox(
                width: 40.w,
                child: CustomOkButton(
                  onTap: () {},
                  color: AppColors.goldenYellow, label: 'موافق',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
