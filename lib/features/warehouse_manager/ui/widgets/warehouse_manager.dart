import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/game_icons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_edit_receiving_shipment_item.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/edit_receiving_shipments_table.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/title_of_columns_receive_shipments.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/card_text_field.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/logistics_entry_screen.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/shipments_info_card.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/subul_receipt_screen.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/upload_number_image_and_name_of_driver_shipment.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/volumetric_weight_calculation.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/add_shipment_form.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_input_field.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/custom_text_field_in_warehouse_manager.dart';
import 'package:subul_manager_dashboard/features/warehouse_manager/ui/widgets/edit_shipping_detail.dart';

class WarehouseManager extends StatelessWidget {
  const WarehouseManager({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.grey, AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 40.h),
                        child: TextLogo(),
                      ),
                      SizedBox(height: size.height / 10),
                      Container(
                        width: 20.w,
                        height: 900.h,
                        decoration: BoxDecoration(
                          color: AppColors.goldenYellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(120),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconOfSideBar(
                              icon: Icons.add,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: false,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              icon: Icons.local_shipping,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: false,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              image: AssetsData.boxShipmmentIcon,
                              onTap: () {},
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: 0,
                  children: [
                    //AddShipmentForm(),
                    // EditReceivingShipmentsTable(
                    //   widget: CustomOkButton(
                    //     onTap: () {},
                    //     color: AppColors.goldenYellow,
                    //     label: 'تعديل',
                    //   ),
                    // ),
                    // EditShippingDetail(),
                  //  LogisticsEntryScreen(),
                    SubulReceiptScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
