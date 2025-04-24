
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class ShipmentInfoCard extends StatelessWidget {
  const ShipmentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 300.w,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.5,
              height: size.height / 11,
              decoration: BoxDecoration(
                color: AppColors.lightGray2,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(width: size.width / 32),
                  Container(height: 2, width: 30.w, color: AppColors.black),
                  SizedBox(width: size.width / 15),
                  Container(height: 2, width: 30.w, color: AppColors.black),
                  SizedBox(width: size.width / 10),
                  Text(
                    '4',
                    style: Styles.textStyle5Sp,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(width: size.width / 6.5),
                  Flexible(
                    child: Text(
                      '24/2/2025',
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(width: size.width / 10),
                  Flexible(
                    child: Text(
                      '7575757577',
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size.width / 60),
          SvgPicture.asset(AssetsData.box, width: 15.w),
        ],
      ),
    );
  }
}
