import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/icon_text_button.dart';

class ConfirmOrFailedReceiveShipment extends StatelessWidget {
  const ConfirmOrFailedReceiveShipment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 1, color: AppColors.deepPurple),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height / 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Image.asset(AssetsData.searchNotesBox, width: 25.w),
              SizedBox(width: size.width / 100),
              Text(
                'كود الشحنة ',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                ' : ',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '7575757577',
                style: Styles.textStyle5Sp.copyWith(
                  color: AppColors.deepPurple,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          SizedBox(height: size.height / 20),
          Column(
            children: [
              IconTextButton(
                icon: Icon(Icons.task_alt, color: AppColors.deepPurple),
                text: 'تم استلام الطرد',
              ),
              SizedBox(height: size.height / 40),
              IconTextButton(
                icon: Icon(Icons.error, color: AppColors.deepPurple),
                text: 'فشل الاستلام',
              ),
            ],
          ),
          SizedBox(height: size.height / 20),
        ],
      ),
    );
  }
}
