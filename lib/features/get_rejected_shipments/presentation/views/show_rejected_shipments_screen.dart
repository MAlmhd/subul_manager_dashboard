import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/domain/use_case/get_rejected_shipments_use_case.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/presentation/manager/cubit/get_rejected_shipments_cubit.dart';
import 'package:subul_manager_dashboard/core/widgets/title_of_columns.dart';
import 'package:subul_manager_dashboard/features/get_rejected_shipments/presentation/views/widgets/custom_shipment_item.dart';

class ShowRejectedShipmentsScreen extends StatelessWidget {
  const ShowRejectedShipmentsScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetRejectedShipmentsCubit(
        sl.get<GetRejectedShipmentsUseCase>(),
      )..getRejectedShipments(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(right: 10.w),
              //       child: CustomSearchItem(
              //         svgPicture: SvgPicture.asset(AssetsData.searchIcon),
              //         onChanged: (item) {
              //           final query = item.trim().isEmpty ? null : item.trim();
              //           context
              //               .read<GetUnapprovedShipmentsCubit>()
              //               .getUnapprovedShipments(query);
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: size.height / 8),
              TitleOfColumns(),
              SizedBox(height: size.height / 50),
              SizedBox(
                height: 800.h,
                child: BlocConsumer<GetRejectedShipmentsCubit,
                    GetRejectedShipmentsState>(
                  listener: (context, state) {
                    if (state is GetRejectedShipmentsFailure) {
                      showSnackBar(context, state.message, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetRejectedShipmentsSuccess) {
                      return ListView.builder(
                        itemCount: state.shipments.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CustomShipmentItem(rejectedShipmentEntity:state.shipments[index] ),
                          ),
                        ),
                      );
                    } else {
                      return CustomProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
