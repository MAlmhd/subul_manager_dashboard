import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_search_item.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/custom_track_shipment_item.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/shippments_logo.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/ui/widgets/title_of_columns_in_track_shippments.dart';

class ShowShippments extends StatelessWidget {
  const ShowShippments({super.key, required this.onTap});
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CustomSearchItem()],
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
          child: ListView.builder(
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: onTap,
                      child: CustomTrackShipmentItem(),
                    ),
                  ),
                ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
