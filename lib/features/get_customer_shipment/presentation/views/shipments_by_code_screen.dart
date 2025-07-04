import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_ok_button.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/domain/use_case/get_customer_shipments_use_case.dart';
import 'package:subul_manager_dashboard/features/get_customer_shipment/presentation/manager/get_customer_shipments_cubit/get_customer_shipments_cubit.dart';

class ShipmentsByCodeScreen extends StatefulWidget {
  const ShipmentsByCodeScreen({super.key});

  @override
  State<ShipmentsByCodeScreen> createState() => _ShipmentsByCodeScreenState();
}

class _ShipmentsByCodeScreenState extends State<ShipmentsByCodeScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 700.h,
      width: 500.w,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 20),
              TextField(
                controller: codeController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'ادخل رمز المستخدم',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(cornerRadius),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              CustomOkButton(
                label: 'بحث عن الشحنات',
                onTap: () {
                  final code = codeController.text.trim();
                  if (code.isNotEmpty) {
                    context
                        .read<GetCustomerShipmentsCubit>()
                        .getCustomerShipments(code: code);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('يرجى إدخال رمز صالح'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                color: AppColors.deepPurple,
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: BlocBuilder<
                  GetCustomerShipmentsCubit,
                  GetCustomerShipmentsState
                >(
                  builder: (context, state) {
                    if (state is GetCustomerShipmentsLoading) {
                      return const CustomProgressIndicator();
                    } else if (state is GetCustomerShipmentsFailure) {
                      return Center(
                        child: Text(state.message, style: Styles.textStyle4Sp),
                      );
                    } else if (state is GetCustomerShipmentsSuccess) {
                      if (state.shipments.isEmpty) {
                        return const Center(
                          child: Text('لا توجد شحنات لهذا الرمز.'),
                        );
                      }
      
                      return ListView.builder(
                        itemCount: state.shipments.length,
                        itemBuilder: (context, index) {
                          final shipment = state.shipments[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGray2,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius: BorderRadius.circular(
                                              cornerRadius,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              shipment.status,
                                              style: Styles.textStyle4Sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          shipment.decalredParcelsCount
                                              .toString(),
                                          style: Styles.textStyle5Sp,
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            shipment.customerName,
                                            style: Styles.textStyle5Sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            shipment.trackingNumber,
                                            style: Styles.textStyle5Sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                SvgPicture.asset(
                                  AssetsData.box,
                                  width: 70.w,
                                  height: 70.h,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
