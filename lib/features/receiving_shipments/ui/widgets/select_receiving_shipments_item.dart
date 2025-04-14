
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class SelectReceivingShipmentsItem extends StatelessWidget {
  const SelectReceivingShipmentsItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 180.w,
      child: Row(
        children: [
          Container(
            width: 130.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.goldenYellow,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'محمد',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Expanded(
                  child: Text(
                    '24/2/52288',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Expanded(
                  child: Text(
                    '7575757577',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width / 80),
          Flexible(child: SvgPicture.asset(AssetsData.box, width: 15.w)),
        ],
      ),
    );
  }
}
