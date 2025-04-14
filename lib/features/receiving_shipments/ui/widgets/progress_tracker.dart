

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.deepPurple,
            maxRadius: 3.w,
            child: SvgPicture.asset(AssetsData.boxx),
          ),
          Container(
            width: 5.w,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.deepPurple,
            maxRadius: 1.w,
          ),
          Container(
            width: 5.w,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.deepPurple,
            maxRadius: 3.w,
            child: SvgPicture.asset(AssetsData.boxx),
          ),
          Container(
            width: 5.w,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.goldenYellow,
            maxRadius: 1.w,
          ),
          Container(
            width: 5.w,
            height: 2,
            decoration: BoxDecoration(
              color: AppColors.deepPurple,
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0XFF00D059),
      
            maxRadius: 3.w,
            child: SvgPicture.asset(AssetsData.checkIcon,),
          ),
        ],
      ),
    );
  }
}
