import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/custom_receiving_shipment_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/title_of_columns_receive_shipments.dart';

class ReceiveShipmentsTable extends StatelessWidget {
  const ReceiveShipmentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
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
        SizedBox(height: size.height / 30),
        SizedBox(
          width: 300.w,
          height: 700.h,
          child: ListView.builder(
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: CustomReceivingShipmentItem(),
                ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
