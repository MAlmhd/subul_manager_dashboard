import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/entities/rejected_shipment_entity.dart';

class CustomShipmentItem extends StatelessWidget {
  const CustomShipmentItem({super.key, required this.rejectedShipmentEntity});
  final RejectedShipmentEntity rejectedShipmentEntity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()
      {
        showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'سبب رفض الشحنة',
          textAlign: TextAlign.center,
        ),
        content: Text(
          rejectedShipmentEntity.reasonOfCancelltion,
          textDirection: TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      );
    },
  );
      },
      child: Row(
        children: [
          SizedBox(width: size.width / 10),
          Container(
            width: size.width / 2.0,
            height: size.height / 11,
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              children: [
                SizedBox(width: size.width / 50),
                Container(
                  width: 30.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: Center(
                    child: Text(
                      rejectedShipmentEntity.status,
                      style: Styles.textStyle4Sp,
                    ),
                  ),
                ),
                SizedBox(width: size.width / 10),
                Text(
                  rejectedShipmentEntity.declaredParcelsCount.toString(),
                  overflow: TextOverflow.visible,
                  style: Styles.textStyle5Sp,
                ),
                SizedBox(width: size.width / 10),
                Flexible(
                  child: Text(
                    rejectedShipmentEntity.customerName,
                    style: Styles.textStyle5Sp,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(width: size.width / 40),
                Flexible(
                  child: Text(
                    rejectedShipmentEntity.trackingNumber,
                    softWrap: true,
                    style: Styles.textStyle5Sp,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: size.width / 20),
          Flexible(
            child: SvgPicture.asset(
              AssetsData.box,
              fit: BoxFit.cover,
              width: 70.w,
              height: 70.h,
            ),
          ),
        ],
      ),
    );
  }
}
