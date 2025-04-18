
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_input_field.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/tracking_number_card.dart';

class AddShipmentForm extends StatelessWidget {
  const AddShipmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(child: SvgPicture.asset(AssetsData.ballon, width: 80.w)),
          ],
        ),
        CustomInputField(
          hintText: 'نوع الشحنة',
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          svgPicture: SvgPicture.asset(AssetsData.boxNotFilled),
        ),
        SizedBox(height: size.height / 20),

        CustomInputField(
          hintText: 'اسم العميل',
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          svgPicture: SvgPicture.asset(AssetsData.person),
        ),
        SizedBox(height: size.height / 20),

        CustomInputField(
          hintText: 'اسم المورد',

          svgPicture: SvgPicture.asset(AssetsData.person),
        ),
        SizedBox(height: size.height / 20),

        CustomInputField(
          hintText: 'رقم الموبايل',

          svgPicture: SvgPicture.asset(AssetsData.phone),
        ),
        SizedBox(height: size.height / 20),
        CustomInputField(
          hintText: 'عدد الطرود',

          svgPicture: SvgPicture.asset(AssetsData.boxNotFilled),
        ),
        SizedBox(height: size.height / 20),
        Container(
          width: 50.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.goldenYellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.deepGray),
          ),
          child: Center(
            child: Text(
              'موافق',
              style: Styles.textStyle4Sp.copyWith(
                color: AppColors.black.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height / 20),
        TrackNumberCard(number: '8428004',)
      ],
    );
  }
}
