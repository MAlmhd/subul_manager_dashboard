import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';

class CustomTrackShipmentItem extends StatelessWidget {
  const CustomTrackShipmentItem({super.key, required this.approvedShipmentEntity});
  final ApprovedShipmentEntity approvedShipmentEntity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 290.w,
      child: Row(
        children: [
          Container(
            width: size.width / 1.5,
            height: size.height / 11,
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              children: [
                SizedBox(width: size.width / 45),
                Row(
                  children: [
                    SvgPicture.asset(AssetsData.money, width: 8.w),
                    SizedBox(width: size.width / 70),
                    Text(approvedShipmentEntity.typeOfShipment, style: Styles.textStyle5Sp),
                  ],
                ),
                SizedBox(width: size.width / 20),
                Container(
                  width: 30.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                  child: Center(
                    child: Text(approvedShipmentEntity.statusOfShipment, style: Styles.textStyle4Sp),
                  ),
                ),
                SizedBox(width: size.width / 10),
                Text(
                  approvedShipmentEntity.numberOfShipment.toString(),
                  overflow: TextOverflow.visible,
                  style: Styles.textStyle5Sp,
                ),
                SizedBox(width: size.width / 10),
                Flexible(
                  child: Text(
                    approvedShipmentEntity.nameOfCustomer,
                    style: Styles.textStyle5Sp,
                    softWrap: true,
                  ),
                ),
                SizedBox(width: size.width / 40),
                Flexible(
                  child: Text(
                    approvedShipmentEntity.trackingString,
                    softWrap: true,
                    style: Styles.textStyle5Sp,
                    overflow: TextOverflow.visible,
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
