import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/un_approved_shipment_entity/un_approved_shipments_entity.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/presentation/manager/approve_shipment_cubit/approve_shipment_cubit.dart';
import 'package:subul_manager_dashboard/features/get_unapproved_shipments/presentation/manager/reject_shipment_cubit/reject_shipment_cubit.dart';

class CustomShipmentItem extends StatefulWidget {
  const CustomShipmentItem({super.key, required this.unApprovedShipment});
  final UnApprovedShipmentsEntity unApprovedShipment;

  @override
  State<CustomShipmentItem> createState() => _CustomShipmentItemState();
}

class _CustomShipmentItemState extends State<CustomShipmentItem> {
  final TextEditingController reasonController = TextEditingController();

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 90.h,
              decoration: BoxDecoration(
                color: AppColors.lightGray2,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Center(
                      child: Text(
                        widget.unApprovedShipment.statusOfShipment,
                        style: Styles.textStyle4Sp,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    widget.unApprovedShipment.numberOfShipments.toString(),
                    style: Styles.textStyle5Sp,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      widget.unApprovedShipment.nameOfCustomer,
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      widget.unApprovedShipment.trackingString,
                      style: Styles.textStyle5Sp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    tooltip: 'الموافقة',
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const CustomProgressIndicator(),
                      );
                      context.read<ApproveShipmentCubit>().approve(
                            id: widget.unApprovedShipment.idOfShipment,
                          );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.red),
                    tooltip: 'رفض',
                    onPressed: () {
                      reasonController.clear();
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: const Text('سبب رفض الشحنة'),
                            content: TextField(
                              controller: reasonController,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText: 'اكتب سبب الرفض هنا...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(dialogContext),
                                child: const Text('إلغاء'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final reason = reasonController.text.trim();
                                  if (reason.isEmpty) {
                                    ScaffoldMessenger.of(dialogContext).showSnackBar(
                                      const SnackBar(
                                        content: Text('يرجى إدخال سبب الرفض'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.pop(dialogContext);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) => const CustomProgressIndicator(),
                                  );
                                  context.read<RejectShipmentCubit>().reject(
                                    id: widget.unApprovedShipment.idOfShipment,
                                    reason: reason,
                                  );
                                },
                                child: const Text('إرسال'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          SvgPicture.asset(AssetsData.box, width: 70.w, height: 70.h),
        ],
      ),
    );
  }
}