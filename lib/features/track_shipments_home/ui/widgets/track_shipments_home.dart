import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_track_shipment_item.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/shippments_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/title_of_columns_in_track_shippments.dart';

class TrackShipmentsHome extends StatefulWidget {
  const TrackShipmentsHome({super.key});

  @override
  State<TrackShipmentsHome> createState() => _TrackShipmentsHomeState();
}

class _TrackShipmentsHomeState extends State<TrackShipmentsHome> {
  int selectedButtonIndex = 0;
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
                    Column(
                      children: [
                       
                        Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [CustomSearchItem()],
                          ),
                        ),
                        SizedBox(height: size.height / 30),
                        Padding(
                          padding: EdgeInsets.only(right: 80.w),
                          child: ShippmentsLogo(),
                        ),

                        SizedBox(height: size.height / 9),
                        TitleOfColumnsInTrackShippments(),
                        SizedBox(height: size.height / 20),
                        SizedBox(
                          width: 290.w,
                          height: 600.h,
                          child: ListView.builder(
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 15.h),
                                  child: CustomTrackShipmentItem(),
                                ),
                            itemCount: 10,
                          ),
                        ),
                      ],
                    ),
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
