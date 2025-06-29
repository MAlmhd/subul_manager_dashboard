import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/use_case/get_unapproved_shipments_use_case.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/presentation/manager/cubit/get_unapproved_shipments_cubit.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/presentation/views/widgets/custom_shipment_item.dart';
import 'package:subul_manager_dashboard/core/widgets/title_of_columns.dart';

class CancelShipment extends StatelessWidget {
  const CancelShipment({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => GetUnapprovedShipmentsCubit(
        sl.get<GetUnapprovedShipmentsUseCase>(),
      )..getUnapprovedShipments(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: CustomSearchItem(
                      svgPicture: SvgPicture.asset(AssetsData.searchIcon),
                      onChanged: (item) {
                        final query = item.trim().isEmpty ? null : item.trim();
                        context
                            .read<GetUnapprovedShipmentsCubit>()
                            .getUnapprovedShipments(query);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height / 8),
              TitleOfColumns(),
              SizedBox(height: size.height / 50),
              SizedBox(
                height: 800.h,
                child: BlocConsumer<GetUnapprovedShipmentsCubit,
                    GetUnapprovedShipmentsState>(
                  listener: (context, state) {
                    if (state is GetUnapprovedShipmentsFailure) {
                      showSnackBar(context, state.message, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    if (state is GetUnapprovedShipmentsSuccess) {
                      return ListView.builder(
                        itemCount: state.shipments.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: onTap,
                              child: CustomShipmentItem(
                                unApprovedShipment: state.shipments[index]
                              ),
                            ),
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
