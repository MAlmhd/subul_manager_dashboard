
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_labeled_border.dart';

class ShipmentReceipt extends StatelessWidget {
  const ShipmentReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 1, color: AppColors.goldenYellow),
      ),
      child: Column(
        children: [
          Image.asset(AssetsData.subulLogo),
          SizedBox(height: size.height / 60),
          CustomLabeledBorder(label: 'تاريخ الشحنة:24/7/2024'),
          SizedBox(height: size.height / 60),
          CustomLabeledBorder(label: 'اسم العميل:رزان'),
          SizedBox(height: size.height / 60),
          CustomLabeledBorder(label: 'رقم العميل:465468486'),
          SizedBox(height: size.height / 60),
          CustomLabeledBorder(label: 'رقم الاستلام:45445'),
          SizedBox(height: size.height / 60),
          CustomLabeledBorder(label: 'الرقم الخاص بالشحنة:54545'),
          SizedBox(height: size.height / 30),
          Container(
            width: 80.w,
            height: 148.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.goldenYellow, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: AppColors.goldenYellow,
                  width: 1,
                ),

                verticalInside: BorderSide(
                  color: AppColors.goldenYellow,
                  width: 1,
                ),
              ),

              children: [
                TableRow(
                  children: [
                    _buildHeaderCell("الملاحظات"),
                    _buildHeaderCell("الوزن"),
                    _buildHeaderCell("الوصف"),
                    _buildHeaderCell("العدد"),
                  ],
                ),
                TableRow(
                  children: [
                    _buildCell(""),
                    _buildCell(""),
                    _buildCell(""),
                    _buildCell(""),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height / 30),
          Text(
            'رفع صورة البوليسة:',
            style: Styles.textStyle4Sp.copyWith(
              color: AppColors.black.withValues(alpha: 0.4),
            ),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: size.height / 40),
          Container(
            width: 25.w,
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(cornerRadius),
              border: Border.all(width: 2, color: AppColors.deepPurple),
            ),
            child: SvgPicture.asset(AssetsData.camera),
          ),
          SizedBox(height: size.height / 40),
          Text(
            'رمز الموظف المستلم:',
            textAlign: TextAlign.end,

            style: Styles.textStyle4Sp.copyWith(
              color: AppColors.black.withValues(alpha: 0.4),
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}

Widget _buildHeaderCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: Styles.textStyle3Sp.copyWith(
        color: AppColors.black.withValues(alpha: 0.4),
      ),
    ),
  );
}

Widget _buildCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 100.h,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Styles.textStyle3Sp.copyWith(
          color: AppColors.black.withValues(alpha: 0.4),
        ),
      ),
    ),
  );
}
