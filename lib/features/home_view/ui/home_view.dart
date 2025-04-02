import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_client/ui/enter_code_for_client.dart';
import 'package:subul_manager_dashboard/core/widgets/side_bar_button.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_client/ui/widgets/registeration_client.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_company/ui/enter_code_for_company.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_company/ui/widgets/registeration_company.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/animations.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/toggle_client_company_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedButtonIndex = 0;
  int step = 0;
  double opacity = 0;
  bool showOtp = false;

  @override
  void initState() {
    _initializeAnimations();
    super.initState();
  }

  void _initializeAnimations() {
    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      setState(() => step++);
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => opacity = 1.0);
    });
  }

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
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: size.height / 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        AssetsData.backgroundImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: size.width / 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 14.w,
                      bottom: size.height / 30,
                      top: size.height / 30,
                    ),
                    child: TextLogo(),
                  ),

                  Row(
                    children: [
                      Container(
                        width: 80.w,
                        height: 700.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(cornerRadius),
                          border: Border.all(
                            color: AppColors.deepPurple,
                            width: 4,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: size.height / 13),
                            Container(
                              width: 65.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColors.goldenYellow,
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ToggleClientCompanyButton(
                                    text: 'شركة',
                                    isSelected: selectedButtonIndex == 1,
                                    onTap: () {
                                      onButtonTap(1);
                                    },
                                  ),
                                  ToggleClientCompanyButton(
                                    text: 'عميل',
                                    isSelected: selectedButtonIndex == 2,
                                    onTap: () {
                                      onButtonTap(2);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height / 16),
                            SideBarButton(
                              onTap: () {
                                //  onButtonTap(3);
                              },
                              text: 'حذف عميل',
                              isSelected: false, //selectedButtonIndex == 3,
                            ),
                            SizedBox(height: size.height / 16),
                            SideBarButton(
                              onTap: () {
                                // onButtonTap(4);
                              },
                              text: 'الغاء شحنة',
                              isSelected: false, // selectedButtonIndex == 4,
                            ),
                            SizedBox(height: size.height / 16),
                            SideBarButton(
                              onTap: () {
                                // onButtonTap(5);
                              },
                              text: 'الشحنات',
                              isSelected: false, // selectedButtonIndex == 5,
                            ),
                            SizedBox(height: size.height / 16),
                            SideBarButton(
                              onTap: () {
                                // onButtonTap(6);
                              },
                              text: 'الشحنات الواردة',
                              isSelected: false, // selectedButtonIndex == 6,
                            ),
                            SizedBox(height: size.height / 16),
                            Image.asset(
                              AssetsData.smallCar,
                              fit: BoxFit.contain,
                              width: 120.w,
                              height: 120.h,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: IndexedStack(
                          index: selectedButtonIndex,
                          children: [
                            // //----------0-------------
                            // Padding(
                            //   padding: EdgeInsets.only(top: 200.h),
                            //   child: Animations(step: step, opacity: opacity),
                            // ),
                            // //----------1-------------
                            // Padding(
                            //   padding: EdgeInsets.only(top: 200.h),
                            //   child: EnterCodeForCompany(
                            //     onTap: () {
                            //       onButtonTap(3);
                            //     },
                            //   ),
                            // ),
                            // //----------2-------------
                            // Padding(
                            //   padding: EdgeInsets.only(top: 200.h),
                            //   child: EnterCodeForClient(
                            //     onTap: () {
                            //       onButtonTap(4);
                            //     },
                            //   ),
                            // ),
                            // //----------3-------------
                            // RegisterationCompany(
                            //   onTap: () {
                            //     setState(() {
                            //       showOtp = !showOtp;
                            //     });
                            //   },
                            //   showOtp: showOtp,
                            // ),
                            // //----------4-----------
                            // RegisterationClient(
                            //   onTap: () {
                            //     showOtp = !showOtp;
                            //   },
                            //   showOtp: showOtp,
                            // ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Container(
                                        width: size.width * 0.2,
                                        height: size.height * 0.08,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),

                                        child: TextField(
                                          textAlign: TextAlign.right,

                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ' ...بحث',
                                            hintStyle: Styles.textStyle16
                                                .copyWith(color: Colors.grey),
                                            contentPadding: EdgeInsets.all(
                                              16.0,
                                            ),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 4,
                                              ),
                                              child: Container(
                                                width: 40,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: AppColors.goldenYellow,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                      AssetsData.searchIcon,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height / 6),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 40.w,
                                    right: 40.w,

                                    bottom: 10.h,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Table(
                                      border: TableBorder.all(
                                        color: AppColors.deepPurple,
                                        width: 1,
                                      ),
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      children: [
                                        ...List.generate(
                                          6,
                                          (index) => TableRow(
                                            children: List.generate(2, (
                                              colIndex,
                                            ) {
                                              return TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,

                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 30.w,
                                                    right: 30.w,
                                                    top: 10.h,
                                                    bottom: 10.h,
                                                  ),
                                                  child: MouseRegion(
                                                    cursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    child: GestureDetector(
                                                      onTap: () {},
                                                      child: SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          children: [
                                                            // SelectedWorkerWidget(isSelected: true),
                                                            //  SizedBox(width: size.width * 0.01),
                                                            Text(
                                                              "shahed",
                                                              style: Styles
                                                                  .textStyle20
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .deepPurple,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        6.sp,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height / 2),
                              ],
                            ),
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
    );
  }
}
