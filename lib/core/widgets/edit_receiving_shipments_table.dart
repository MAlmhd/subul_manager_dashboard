import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/flag_code_country.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/title_of_columns_receive_shipments.dart';

class EditReceivingShipmentsTable extends StatelessWidget {
  const EditReceivingShipmentsTable({super.key, this.widget});
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 280.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomSearchItem(
                    backgoundColor: AppColors.white,
                    hintText: 'فلترة من خلال',
                    icon: Icon(Icons.tune, color: AppColors.white),
                    textColor: AppColors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 10),
            TitleOfColumnsReceiveShipments(),
            SizedBox(height: size.height / 20),
            SizedBox(
              height: 700.h,
              width: 300.w,
              child: ListView.builder(
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: CustomEditReceivingShipmentItem(),
                    ),
                itemCount: 10,
              ),
            ),
            SizedBox(height: size.height / 20),
            widget ?? Container(),
          ],
        ),
        
      ],
    );
  }
}

class CustomEditReceivingShipmentItem extends StatelessWidget {
  const CustomEditReceivingShipmentItem({super.key});

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
                  SvgPicture.asset(AssetsData.editIcon),
                  SizedBox(width: size.width / 50),
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
