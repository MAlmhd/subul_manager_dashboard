
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class CustomItemInShowAllShipmentsTable extends StatelessWidget {
  const CustomItemInShowAllShipmentsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '7575757577',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
