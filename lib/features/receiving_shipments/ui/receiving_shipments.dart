import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/clarity.dart';
import 'package:iconify_flutter/icons/la.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_calendar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/otp.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/confirm_or_failed_receive_shipment.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/custom_error_widget.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/custom_switch_label.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/edit_information_of_receiving_shipments.dart';
import 'package:subul_manager_dashboard/core/widgets/edit_receiving_shipments_table.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/enter_details_of_shipments.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/grid_of_shipments_status_card.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/icon_text_button.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/list_for_selecting_shipments_receiving.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/progress_tracker.dart';

import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/receive_shipments_table.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/received_dialog.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/select_receiving_shipments_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/shipment_status_card.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/shipments_delivered_item.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/show_shipments_delivered.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/time_date_booking.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/upload_image_for_shipment.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';

class ReceivingShipments extends StatelessWidget {
  const ReceivingShipments({super.key});

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
                    //ReceiveShipmentsTable(),
                    // EditReceivingShipmentsTable(),
                    // TimeDateBooking(),
                    //  ConfirmOrFailedReceiveShipment(),
                    // ReceivedDialog(),
                    // EnterDetailsOfShipments(),
                    // CustomCalendar(
                    //   onTap: () {
                    //     showTimePicker(
                    //       context: context,
                    //       initialTime: TimeOfDay.now(),
                    //     );
                    //   },
                    // ),
                    // ShowShipmentsDelivered()
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       //GridOfShipmentsStatusCard(),
                    //       EditInformationOfReceivingShipments(),
                    //       ListForSelectingShipmentsReceiving(),
                    //     ],
                    //   ),
                    // ),

                    //  ReceivedDialog(message: 'هنيئاً ... الآن نحتاج لملئ استمارة تثبيت الاستلام ',),
                   CustomErrorWidget()
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
