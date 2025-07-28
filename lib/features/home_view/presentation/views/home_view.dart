import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/extensions.dart';
import 'package:subul_manager_dashboard/core/routing/routes.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/side_bar_button.dart';
import 'package:subul_manager_dashboard/core/widgets/text_logo.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/use_case/get_customer_shipments_use_case.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/presentation/manager/get_customer_shipments_cubit/get_customer_shipments_cubit.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/presentation/views/shipments_by_code_screen.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/presentation/views/show_rejected_shipments_screen.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/presentation/views/unapproved_shipments_screen.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/presentation/show_companies_and_clients.dart';
import 'package:subul_manager_dashboard/features/register_client/presentation/views/registeration_client.dart';
import 'package:subul_manager_dashboard/features/home_view/presentation/views/widgets/animations.dart';
import 'package:subul_manager_dashboard/features/home_view/presentation/views/widgets/toggle_client_company_button.dart';
import 'package:subul_manager_dashboard/features/register_company/presentation/views/register_company_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedButtonIndex = 0;
  // int step = 0;
  // double opacity = 0;
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
   // _initializeAnimations();
  }

  // void _initializeAnimations() {
  //   _timer = Timer.periodic(const Duration(milliseconds: 900), (timer) {
  //     if (mounted) setState(() => step++);
  //   });
  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     if (mounted) setState(() => opacity = 1.0);
  //   });
  // }

  @override
  void dispose() {
   // _timer.cancel();
    super.dispose();
  }

  void onButtonTap(int index) {
    setState(() => selectedButtonIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
        child: Row(
          
          children: [
            // Sidebar
            Container(
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornerRadius),
                border: Border.all(color: AppColors.deepPurple, width: 4),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: size.width / 50),
                children: [
                  SizedBox(height: size.height / 13),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.goldenYellow,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ToggleClientCompanyButton(
                          text: 'شركة',
                          isSelected: selectedButtonIndex == 1,
                          onTap: () => onButtonTap(1),
                        ),
                        ToggleClientCompanyButton(
                          text: 'عميل',
                          isSelected: selectedButtonIndex == 2,
                          onTap: () => onButtonTap(2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 16),
                  SideBarButton(
                    onTap: () => onButtonTap(3),
                    text: 'حذف عميل',
                    isSelected: selectedButtonIndex == 3,
                  ),
                  SizedBox(height: size.height / 16),
                  SideBarButton(
                    onTap: () => onButtonTap(4),
                    text: 'الغاء شحنة',
                    isSelected: selectedButtonIndex == 4,
                  ),
                  SizedBox(height: size.height / 16),
                  SideBarButton(
                    onTap: () => context.pushNamed(Routes.trackShipmentsHome),
                    text: 'الشحنات',
                    isSelected: false,
                  ),
                  SizedBox(height: size.height / 16),
                  SideBarButton(
                    onTap: () => onButtonTap(5),
                    text: 'الشحنات المرفوضة',
                    isSelected: selectedButtonIndex == 5,
                  ),
                  SizedBox(height: size.height / 16),
                  SideBarButton(
                    onTap: () => onButtonTap(6),
                    text: 'شحنات زبون معين',
                    isSelected: selectedButtonIndex == 6,
                  ),
                ],
              ),
            ),
        
            // Main Content
            Expanded(
              child: IndexedStack(
                index: selectedButtonIndex,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: Animations(),
                  ),
                  SingleChildScrollView(child: RegisterCompanyScreen()),
                  SingleChildScrollView(child: RegisterationClient()),
                  SingleChildScrollView(child: ShowCompaniesAndClients()),
                  SingleChildScrollView(child: UnApprovedShipmentsScreen()),
                  SingleChildScrollView(child: ShowRejectedShipmentsScreen()),
                  BlocProvider(
                    create: (context) => GetCustomerShipmentsCubit(
                      sl.get<GetCustomerShipmentsUseCase>(),
                    ),
                    child: SingleChildScrollView(child: ShipmentsByCodeScreen()),
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
