import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_labeled_border.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/shipment_receipt.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/upload_number_image_and_name_of_driver_shipment.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/volumetric_weight_calculation.dart';

class SubulReceiptScreen extends StatelessWidget {
  const SubulReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 700.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 160.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      'تاريخ الدفع',
                      style: Styles.textStyle4Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      'تاريخ الدفع المستحق',
                      style: Styles.textStyle4Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      'العميل',
                      style: Styles.textStyle4Sp,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: size.width / 80),
            SizedBox(
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray2,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 25.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.brightBlue,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                          child: Center(
                            child: Text('تعديل', style: Styles.textStyle4Sp),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            '7/8/2024',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle4Sp,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            '4/1/2024',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle4Sp,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            'شهد',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle4Sp,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width / 50),
                  SizedBox(
                    width: 18.w,
                    child: SvgPicture.asset(AssetsData.box),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ShipmentReceipt(),
                  SizedBox(width: size.width / 50),
                  UploadNumberImageAndNameOfDriverShipment(),
                  SizedBox(width: size.width / 50),
                  VolumetricWeightCalculation(showBluryBackground: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
