import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/receiving_shipments/ui/widgets/shipment_status_card.dart';

class GridOfShipmentsStatusCard extends StatelessWidget {
  const GridOfShipmentsStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 700.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(width: 2, color: AppColors.deepPurple),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 5.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 1, // Adjust based on your card size
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShipmentStatusCard();
        },
      ),
    );
  }
}
