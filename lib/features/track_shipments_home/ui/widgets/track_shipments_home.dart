import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_icon_of_side_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/bill_of_shippment.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_radio.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/shippments_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/square_price.dart';

class TrackShipmentsHome extends StatefulWidget {
  const TrackShipmentsHome({super.key});

  @override
  State<TrackShipmentsHome> createState() => _TrackShipmentsHomeState();
}

class _TrackShipmentsHomeState extends State<TrackShipmentsHome> {
  int selectedButtonIndex = 0;
  int selectedPrice = 100;
  bool isTaxIncluded = true;
  TextEditingController priceController = TextEditingController();
  void selectPrice(int price) {
    setState(() {
      selectedPrice = price;
      priceController.text = price.toString();
    });
  }

  void onButtonTap(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
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
                    // Container(),
                    // ShowShippments(onTap: () {  },),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [CustomSearchItem()],
                          ),
                        ),
                        SizedBox(height: size.height / 5),
                        Padding(
                          padding: EdgeInsets.only(right: 80.w),
                          child: ShippmentsLogo(),
                        ),

                        SizedBox(height: size.height / 9),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 150.w,
                                height: 500.h,
                                decoration: BoxDecoration(
                                  color: AppColors.lightGray2,
                                  borderRadius: BorderRadius.circular(
                                    cornerRadius,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'أدخل المبلغ',
                                      style: Styles.textStyle6Sp,
                                    ),

                                    Container(
                                      width: 70.w,
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,

                                            spreadRadius: 2,
                                            blurRadius: 1.3,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: TextField(
                                          controller: priceController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'أدخل مبلغ الشحن',
                                            hintStyle: Styles.textStyle3Sp
                                                .copyWith(
                                                  color: AppColors.gunmetal,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,

                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          PriceSquare(
                                            price: 100,
                                            onTap: () {
                                              selectPrice(100);
                                            },
                                            isSelected: selectedPrice == 100,
                                          ),
                                          PriceSquare(
                                            price: 200,
                                            onTap: () {
                                              selectPrice(200);
                                            },
                                            isSelected: selectedPrice == 200,
                                          ),
                                          PriceSquare(
                                            price: 300,
                                            onTap: () {
                                              selectPrice(300);
                                            },
                                            isSelected: selectedPrice == 300,
                                          ),
                                          PriceSquare(
                                            price: 400,
                                            onTap: () {
                                              selectPrice(400);
                                            },
                                            isSelected: selectedPrice == 400,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'الرجاء تحديد إذا كانت الشحنة تشمل ضرائب أم لا',
                                            style: Styles.textStyle4Sp,
                                          ),
                                          Flexible(
                                            child: SvgPicture.asset(
                                              AssetsData.purbleBox,
                                              width: 9.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 50.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'تشمل الضريبة؟',
                                            style: Styles.textStyle4Sp,
                                          ),
                                          Switch(
                                            value: isTaxIncluded,
                                            onChanged: (value) {
                                              setState(() {
                                                isTaxIncluded = value;
                                              });
                                            },
                                            activeColor: AppColors.white,
                                            activeTrackColor:
                                                AppColors.deepPurple,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 30.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 20.w,
                                            height: 30.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.deepPurple,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    cornerRadius,
                                                  ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'أدخل التاريخ',
                                                style: Styles.textStyle3Sp
                                                    .copyWith(
                                                      color:
                                                          AppColors.lightGray2,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'هل يمكن دفع الفاتورة الان؟',
                                            style: Styles.textStyle4Sp.copyWith(
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          CustomRadio(isSelected: true),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: size.width / 50),
                              BillOfShippment(),
                            ],
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
