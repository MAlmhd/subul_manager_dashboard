import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_overlay.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/pay_the_bill.dart';

class BillOfShippment extends StatelessWidget {
  const BillOfShippment({super.key, required this.approvedShipmentEntity});
  final ApprovedShipmentEntity approvedShipmentEntity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 150.w,
      height: 500.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          approvedShipmentEntity.trackingString,
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          approvedShipmentEntity.nameOfCustomer,
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          approvedShipmentEntity.numberOfShipment.toString(),
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Container(
                          width: 30.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                          child: Center(
                            child: Text(
                              approvedShipmentEntity.statusOfShipment,
                              style: Styles.textStyle5Sp,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Text(
                          approvedShipmentEntity.typeOfShipment,
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width / 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'كود الشحنة',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          'العميل',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          'عدد الطرود',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          'حالة الشحنة',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                        Text(
                          'نوع الشحن',
                          style: Styles.textStyle6Sp,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (){
                  showOverlay(context, PayTheBill(approvedShipmentEntity: approvedShipmentEntity,));
                },
                child: Container(
                  width: 60.w,
                  height: 50.h,

                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(cornerRadius),
                    border: Border.all(color: AppColors.deepPurple, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      'الفاتورة',
                      style: Styles.textStyle6Sp,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height / 24),
          ],
        ),
      ),
    );
  }
}
