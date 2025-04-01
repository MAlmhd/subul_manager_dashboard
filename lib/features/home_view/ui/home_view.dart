import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_client/ui/enter_code_for_client.dart';
import 'package:subul_manager_dashboard/core/widgets/side_bar_button.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/enter_code_for_company/ui/enter_code_for_company.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/animations.dart';
import 'package:subul_manager_dashboard/features/home_view/ui/widgets/toggle_client_company_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  int selectedButtonIndex = -1;
  int step = 0;
  double opacity = 0;

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
                      Padding(
                        padding: EdgeInsets.only(bottom: size.height / 25),
                        child: Container(
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
                                  onButtonTap(3);
                                },
                                text: 'حذف عميل',
                                isSelected: selectedButtonIndex == 3,
                              ),
                              SizedBox(height: size.height / 16),
                              SideBarButton(
                                onTap: () {
                                  onButtonTap(4);
                                },
                                text: 'الغاء شحنة',
                                isSelected: selectedButtonIndex == 4,
                              ),
                              SizedBox(height: size.height / 16),
                              SideBarButton(
                                onTap: () {
                                  onButtonTap(5);
                                },
                                text: 'الشحنات',
                                isSelected: selectedButtonIndex == 5,
                              ),
                              SizedBox(height: size.height / 16),
                              SideBarButton(
                                onTap: () {
                                  onButtonTap(6);
                                },
                                text: 'الشحنات الواردة',
                                isSelected: selectedButtonIndex == 6,
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
                      ),
                      Expanded(
                        child: IndexedStack(
                          index: currentIndex,
                          children: [
                            Animations(step: step, opacity: opacity),
                            EnterCodeForCompany(),
                            EnterCodeForClient(),
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
