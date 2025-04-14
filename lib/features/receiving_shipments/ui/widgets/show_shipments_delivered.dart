import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/shipments_delivered_item.dart';

class ShowShipmentsDelivered extends StatelessWidget {
  const ShowShipmentsDelivered({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 50.h, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSearchItem(
                backgoundColor: AppColors.white,
                hintText: 'بحث...',
                svgPicture: SvgPicture.asset(AssetsData.searchIcon),
                textColor: AppColors.black,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300.w,
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'العميل',
                style: Styles.textStyle5Sp,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                'تاريخ الإرسال',
                style: Styles.textStyle5Sp,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                'رمز العميل',
                style: Styles.textStyle5Sp,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
        //  SizedBox(width: size.height / 4),
        SizedBox(
          width: 300.w,
          height: 600.h,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ShipmentsDeliveredItem(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.goldenYellow,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إنشاء شحنة',
                    style: Styles.textStyle3Sp.copyWith(color: AppColors.white),
                  ),
                  Icon(Icons.add, color: AppColors.white),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
