import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/cancel_shipment/ui/widgets/custom_shipment_item.dart';
import 'package:subul_manager_dashboard/features/cancel_shipment/ui/widgets/title_of_columns.dart';

class CancelShipment extends StatelessWidget {
  const CancelShipment({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CustomSearchItem(),
            ),
          ],
        ),
        SizedBox(height: size.height / 8),
        TitleOfColumns(),
        SizedBox(height: size.height / 50),
        SizedBox(
          height: 800.h,
          child: ListView.builder(
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onTap,
                      child: CustomShipmentItem(),
                    ),
                  ),
                ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
