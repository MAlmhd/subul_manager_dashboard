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
import 'package:subul_manager_dashboard/core/widgets/custom_edit_receiving_shipment_item.dart';
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
