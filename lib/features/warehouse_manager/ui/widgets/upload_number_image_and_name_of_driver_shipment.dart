
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/card_text_field.dart';

class UploadNumberImageAndNameOfDriverShipment extends StatelessWidget {
  const UploadNumberImageAndNameOfDriverShipment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 120.w,
      height: 500.h,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 1, color: AppColors.goldenYellow),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardTextField(
            svgPicture: SvgPicture.asset(AssetsData.outlinePurpleBox),
            hintText: 'عدد الطرود',
          ),
          SizedBox(height: size.height / 25),
          CardTextField(
            svgPicture: SvgPicture.asset(AssetsData.personName),
            hintText: 'اسم السائق',
          ),
          SizedBox(height: size.height / 20),
          Container(
            width: 65.w,
            height: 120.h,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.topCenter,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'ارفع صورة الشحنة',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Styles.textStyle4Sp,
                  ),
                ),
                Flexible(
                  child: Icon(
                    Icons.camera_enhance_outlined,
                    color: AppColors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 20),
          CustomOkButton(
            onTap: () {},
            color: AppColors.goldenYellow,
            label: 'موافق',
          ),
        ],
      ),
    );
  }
}
