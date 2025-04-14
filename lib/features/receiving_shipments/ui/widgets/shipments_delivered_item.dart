import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class ShipmentsDeliveredItem extends StatelessWidget {
  const ShipmentsDeliveredItem({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: SizedBox(
        width: double.infinity, // Take full available width
        child: Row(
          children: [
            SizedBox(width: size.width / 6.7),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.lightGray2,
                  borderRadius: BorderRadius.circular(cornerRadius),
                ),
                child: Row(
                  children: [
                    //  SizedBox(width: size.width / 6.7),
                    Expanded(
                      child: Text(
                        'شهد',
                        style: Styles.textStyle5Sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //   SizedBox(width: size.width / 10),
                    Expanded(
                      child: Text(
                        '24/2/52288',
                        style: Styles.textStyle5Sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: size.width / 30),
                    Expanded(
                      child: Text(
                        '7575757577',
                        style: Styles.textStyle5Sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    // SizedBox(width: size.width / 15),
                  ],
                ),
              ),
            ),
            SizedBox(width: size.width / 37),
            SvgPicture.asset(AssetsData.box, width: 16.w),
            SizedBox(width: size.width / 17),
          ],
        ),
      ),
    );
  }
}
