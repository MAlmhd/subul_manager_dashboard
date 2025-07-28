import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/extensions.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/routing/routes.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_calendar.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/approved_shipment_entity/approved_shipment_entity.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/create_invoice_use_case/create_invoice_use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/manager/create_invoice_cubit/create_invoice_cubit.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/square_price.dart';

class PayTheBill extends StatefulWidget {
  const PayTheBill({super.key, this.approvedShipmentEntity});
  final ApprovedShipmentEntity? approvedShipmentEntity;

  @override
  State<PayTheBill> createState() => _PayTheBillState();
}

class _PayTheBillState extends State<PayTheBill> {
  DateTime? date;

  TextEditingController priceController = TextEditingController();
  int selectedPrice = 100;

  void selectPrice(int price) {
    setState(() {
      selectedPrice = price;
      priceController.text = price.toString();
    });
  }

  void showCalendarOverlay(
    BuildContext context,
    Function(DateTime) onDateSelected,
  ) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              // تغطية الخلفية
              GestureDetector(
                onTap: () => overlayEntry.remove(),
                child: Container(color: Colors.black54),
              ),

              // محتوى التقويم
              Center(
                child: CustomCalendar(
                  onDateSelected: (date) {
                    onDateSelected(date);
                    overlayEntry.remove(); // ✅ إخفاء التقويم بعد التحديد
                  },
                ),
              ),
            ],
          ),
    );

    overlay.insert(overlayEntry);
  }

  @override
  void dispose() {
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create:
              (context) => CreateInvoiceCubit(sl.get<CreateInvoiceUseCase>()),
          child: Container(
            width: 150.w,
            height: 500.h,
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'أدخل المبلغ',
                  style: Styles.textStyle6Sp,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),

                Container(
                  width: 70.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,

                        spreadRadius: 2,
                        blurRadius: 1.3,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'أدخل مبلغ الشحن',

                        hintStyle: Styles.textStyle3Sp.copyWith(
                          color: AppColors.gunmetal,
                        ),
                      ),
                      textAlign: TextAlign.center,

                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PriceSquare(
                        price: 100,
                        onTap: () {
                          selectPrice(100);
                        },
                        isSelected: selectedPrice == 100,
                      ),
                      PriceSquare(
                        price: 200,
                        onTap: () {
                          selectPrice(200);
                        },
                        isSelected: selectedPrice == 200,
                      ),
                      PriceSquare(
                        price: 300,
                        onTap: () {
                          selectPrice(300);
                        },
                        isSelected: selectedPrice == 300,
                      ),
                      PriceSquare(
                        price: 400,
                        onTap: () {
                          selectPrice(400);
                        },
                        isSelected: selectedPrice == 400,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: size.width / 160),
                if (date != null)
                  Text(
                    "${date!.year}/${date!.month}/${date!.day}",
                    style: Styles.textStyle5Sp,
                  ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      showCalendarOverlay(context, (selectedDate) {
                        date = selectedDate;
                        setState(() {});
                      });
                    },

                    child: Container(
                      width: 20.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.deepPurple,
                        borderRadius: BorderRadius.circular(cornerRadius),
                      ),
                      child: Center(
                        child: Text(
                          'أدخل التاريخ',
                          style: Styles.textStyle3Sp.copyWith(
                            color: AppColors.lightGray2,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: BlocConsumer<CreateInvoiceCubit, CreateInvoiceState>(
                      listener: (context, state) {
                        if (state is CreateInvoiceFailure) {
                          showSnackBar(context, state.message, Colors.red);
                        } else if (state is CreateInvoiceSuccess) {
                          showSnackBar(
                            context,
                            "تم إنشاء الفاتورة بنجاح",
                            Colors.green,
                          );
                          context.pushNamed(Routes.trackShipmentsHome);
                        }
                      },
                      builder: (context, state) {
                        if (state is CreateInvoiceLoading) {
                          return CustomProgressIndicator();
                        }

                        return GestureDetector(
                          onTap: () {
                            if (priceController.text.trim().isEmpty) {
                              showSnackBar(context, "أدخل السعر", Colors.red);
                              return;
                            }

                            if (date == null) {
                              showSnackBar(context, "أدخل التاريخ", Colors.red);
                              return;
                            }

                            double? priceDecimal = double.tryParse(
                              priceController.text,
                            );
                            if (priceDecimal == null) {
                              showSnackBar(
                                context,
                                "السعر غير صالح",
                                Colors.red,
                              );
                              return;
                            }

                            DateTime dateTime = DateTime.parse(date.toString());
                            String formattedDate =
                                dateTime.toIso8601String().split('T').first;

                            context.read<CreateInvoiceCubit>().createInvoice(
                              customerId:
                                  widget.approvedShipmentEntity!.idOfCustomer,
                              shipmentId:
                                  widget.approvedShipmentEntity!.idOfShipment,
                              amount: priceDecimal,
                              includesTax: false,

                              payableAt: formattedDate,
                            );
                          },
                          child: Container(
                            width: 60.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColors.deepPurple,
                              borderRadius: BorderRadius.circular(cornerRadius),
                            ),
                            child: Center(
                              child: Text(
                                'انشاء فاتورة',
                                style: Styles.textStyle3Sp.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
