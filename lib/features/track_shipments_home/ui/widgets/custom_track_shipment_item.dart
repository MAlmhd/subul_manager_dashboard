import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomTrackShipmentItem extends StatelessWidget {
  const CustomTrackShipmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 290.w,
      child: Row(
        children: [
          Container(
            width: size.width / 1.5,
            height: size.height / 11,
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              children: [
                SizedBox(width: size.width / 45),
                Row(
                  children: [
                    SvgPicture.asset(AssetsData.money, width: 8.w),
                    SizedBox(width: size.width / 70),
                    Text('شحن ودفع', style: Styles.textStyle5Sp),
                  ],
                ),
                SizedBox(width: size.width / 20),
                Container(
                  width: 30.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: Center(
                    child: Text('مكتملة', style: Styles.textStyle4Sp),
                  ),
                ),
                SizedBox(width: size.width / 10),
                Text(
                  '4',
                  overflow: TextOverflow.visible,
                  style: Styles.textStyle5Sp,
                ),
                SizedBox(width: size.width / 10),
                Flexible(
                  child: Text(
                    'محمد ابراهيم المحمود',
                    style: Styles.textStyle5Sp,
                    softWrap: true,
                  ),
                ),
                SizedBox(width: size.width / 40),
                Flexible(
                  child: Text(
                    '74747437345',
                    softWrap: true,
                    style: Styles.textStyle5Sp,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width / 20),
          Flexible(
            child: SvgPicture.asset(
              AssetsData.box,
              fit: BoxFit.cover,
              width: 70.w,
              height: 70.h,
            ),
          ),
        ],
      ),
    );
  }
}
