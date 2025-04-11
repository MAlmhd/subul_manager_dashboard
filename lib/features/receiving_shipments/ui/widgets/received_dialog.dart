import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';

class ReceivedDialog extends StatelessWidget {
  const ReceivedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 60.h),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تم الاستلام',
            style: Styles.textStyle5Sp.copyWith(color: AppColors.deepPurple),
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          SizedBox(height: size.height / 20),
          SvgPicture.asset(AssetsData.hand, width: 25.w),
        ],
      ),
    );
  }
}
