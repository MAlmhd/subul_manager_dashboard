import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/bill_of_shippment.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_calendar.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/details_of_bill.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/pay_the_bill.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/shippments_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/show_pickup_time.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/show_shippments.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/thanks_widget.dart';

class TrackShipmentsHome extends StatefulWidget {
  const TrackShipmentsHome({super.key});

  @override
  State<TrackShipmentsHome> createState() => _TrackShipmentsHomeState();
}

class _TrackShipmentsHomeState extends State<TrackShipmentsHome> {
  int selectedButtonIndex = 0;
  bool showPayTheBill = false;
  bool showCalendar = false;
  bool showPickupWidget = false;
  bool showThanksWidget = false;
  bool showBillFile = false;
  bool showDetailsOfBill = false;

  void onButtonTap(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

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
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              icon: Icons.add,
                              color: AppColors.goldenYellow,
                              onTap: () {
                                onButtonTap(0);
                              },
                              isSelected: selectedButtonIndex == 0,
                            ),
                            SizedBox(height: size.height / 20),
                            CustomIconOfSideBar(
                              icon: Icons.local_shipping,
                              color: AppColors.white,
                              onTap: () {
                                onButtonTap(1);
                              },
                              isSelected: selectedButtonIndex == 1,
                            ),

                            SizedBox(height: size.height / 20),
                            CustomIconOfSideBar(
                              image: AssetsData.notesIcon,
                              onTap: () {
                                onButtonTap(2);
                              },
                              isSelected: selectedButtonIndex == 2,
                            ),
                            SizedBox(height: size.height / 20),
                            CustomIconOfSideBar(
                              icon: Icons.edit_square,
                              color: Colors.white,
                              onTap: () {
                                onButtonTap(3);
                              },
                              isSelected: selectedButtonIndex == 3,
                            ),
                            SizedBox(height: size.height / 20),
                            CustomIconOfSideBar(
                              image: AssetsData.boxShipmmentIcon,
                              onTap: () {
                                onButtonTap(4);
                              },
                              isSelected: selectedButtonIndex == 4,
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
                  index: selectedButtonIndex,
                  children: [
                    Container(),
                    ShowShippments(
                      onTap: () {
                        onButtonTap(2);
                      },
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (showPayTheBill)
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: Expanded(
                                      child: Center(
                                        child: PayTheBill(
                                          onTap: () {
                                            setState(() {
                                              showCalendar = !showCalendar;
                                            });
                                          },
                                          showBillFile: showBillFile,
                                          showDetailsOfBill: showDetailsOfBill,
                                          showDetailsofBillWidget: () {
                                            setState(() {
                                              showDetailsOfBill =
                                                  !showDetailsOfBill;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Center(
                                    child: BillOfShippment(
                                      onTap: () {
                                        setState(() {
                                          showPayTheBill = !showPayTheBill;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height / 20),
                            if (showDetailsOfBill)
                              SizedBox(
                                height: 500.h,
                                child: SingleChildScrollView(
                                  child: DetailsOfBill(),
                                ),
                              ),
                          ],
                        ),

                        // if (showDetailsOfBill)// Align(alignment: Alignment.bottomCenter,child: DetailsOfBill(),),
                        if (showPayTheBill && showCalendar)
                          Align(
                            alignment: Alignment.center,
                            child: CustomCalendar(
                              onTap: () {
                                setState(() {
                                  showPickupWidget = !showPickupWidget;
                                  showCalendar = false;
                                });
                              },
                            ),
                          ),
                        if (showPickupWidget)
                          Align(
                            alignment: Alignment.center,
                            child: ShowPickupTime(
                              onTap: () {
                                setState(() {
                                  showThanksWidget = !showThanksWidget;
                                });
                              },
                            ),
                          ),
                        if (showThanksWidget)
                          Align(
                            alignment: Alignment.center,
                            child: ThanksWidget(
                              onTap: () {
                                setState(() {
                                  showPickupWidget = false;
                                  showThanksWidget = false;
                                  showBillFile = true;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     // Padding(
                    //     //   padding: EdgeInsets.only(right: 25.w),
                    //     //   child: Row(
                    //     //     mainAxisAlignment: MainAxisAlignment.end,
                    //     //     children: [CustomSearchItem()],
                    //     //   ),
                    //     // ),
                    //     // SizedBox(height: size.height / 5),
                    //     // Padding(
                    //     //   padding: EdgeInsets.only(right: 80.w),
                    //     //   child: ShippmentsLogo(),
                    //     // ),
                    //     SizedBox(height: size.height / 9),

                    //     //CustomCalendar(),
                    //     // Column(
                    //     //   children: [
                    //     //     Row(
                    //     //       children: [
                    //     //         Expanded(child: PayTheBill()),
                    //     //         SizedBox(width: size.width / 50),
                    //     //         Expanded(child: BillOfShippment()),
                    //     //       ],
                    //     //     ),
                    //     //     SizedBox(height: size.height / 30),
                    //     //     DetailsOfBill(),
                    //     //   ],
                    //     // ),
                    //     //  Center(child: ShowPickupTime()),
                    //   //  Center(child: ThanksWidget()),
                    //   ],
                    // ),
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
