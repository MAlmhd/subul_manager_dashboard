import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/features/cancel_shipment/ui/widgets/custom_shipment_item.dart';
import 'package:subul_manager_dashboard/features/cancel_shipment/ui/widgets/title_of_columns.dart';

class CancelShipment extends StatelessWidget {
  const CancelShipment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        TitleOfColumns(),
        SizedBox(height: size.height / 50),
        SizedBox(
          height: 800.h,
          child: ListView.builder(
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomShipmentItem(),
                ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
