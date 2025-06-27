import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_overlay.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/manager/get_approved_shipment/get_approved_shipment_cubit.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/bill_of_shippment.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/custom_track_shipment_item.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/shippments_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/title_of_columns_in_track_shippments.dart';

class ShowShippments extends StatefulWidget {
  const ShowShippments({super.key});

  @override
  State<ShowShippments> createState() => _ShowShippmentsState();
}

class _ShowShippmentsState extends State<ShowShippments> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CustomSearchItem(svgPicture: SvgPicture.asset(AssetsData.searchIcon,),onChanged: (searchText) {
    context.read<GetApprovedShipmentCubit>().getApprovedShipments(
      searchText.trim().isEmpty ? null : searchText,
    );
  },)],
          ),
        ),
        SizedBox(height: size.height / 30),
        Padding(padding: EdgeInsets.only(right: 80.w), child: ShippmentsLogo()),

        SizedBox(height: size.height / 9),
        TitleOfColumnsInTrackShippments(),
        SizedBox(height: size.height / 20),
        SizedBox(
          width: 290.w,
          height: 600.h,
          child:
              BlocConsumer<GetApprovedShipmentCubit, GetApprovedShipmentState>(
                listener: (context, state) {
                  if (state is GetApprovedShipmentFailure) {
                    showSnackBar(context, state.message, Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is GetApprovedShipmentSuccess) {
                    return ListView.builder(
                      itemBuilder:
                          (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: ()
                                {
                                  showOverlay(context, BillOfShippment(approvedShipmentEntity: state.shipments[index],));
                                },
                                child: CustomTrackShipmentItem(approvedShipmentEntity: state.shipments[index],),
                              ),
                            ),
                          ),
                      itemCount: state.shipments.length,
                    );
                  } else {
                    return CustomProgressIndicator();
                  }
                },
              ),
        ),
      ],
    );
  }
}
