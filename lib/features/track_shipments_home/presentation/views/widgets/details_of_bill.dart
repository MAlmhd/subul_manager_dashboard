import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/core/utils/functions/show_snack_bar.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/use_case/get_invoices_use_case/get_invoice_use_case.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/manager/get_invoices_cubit/get_invoices_cubit.dart';

class DetailsOfBill extends StatelessWidget {
  final int id;
  const DetailsOfBill({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create:
          (context) =>
              GetInvoicesCubit(sl.get<GetInvoiceUseCase>())..getInvoice(id: id),
      child: Scaffold(
        body: BlocConsumer<GetInvoicesCubit, GetInvoicesState>(
          listener: (context, state) {
            if (state is GetInvoicesFailure) {
              showSnackBar(context, state.message, Colors.red);
            }
          },
          builder: (context, state) {
            if (state is GetInvoicesSuccess) {
              if (state.invoice.success == false) {
                return Center(child: Text('لا توجد فاتورة',style: Styles.textStyle7Sp,));
              }
              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 300.w,
                    height: 1000.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray2,
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ':ملف الفاتورة',
                                style: Styles.textStyle5Sp,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                              SizedBox(width: size.width / 60),
                              CircleAvatar(
                                maxRadius: 5.w,
                                backgroundColor: AppColors.deepPurple,
                                child: Icon(
                                  Icons.credit_card,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height / 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    'http://localhost/Subul/public${state.invoice.qrCode}',
                                    width: size.width / 5,
                                    placeholderBuilder:
                                        (context) =>
                                            const CircularProgressIndicator(),
                                  ),
                                  SizedBox(height: size.height / 20),
                                  Text(
                                    'كود الاستلام',
                                    style: Styles.textStyle5Sp,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: size.height / 20),
                                  Container(
                                    width: 70.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${state.invoice.declaredParcelsCount} طرود',
                                            textDirection: TextDirection.rtl,
                                            style: Styles.textStyle4Sp,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                          ),
                                          SizedBox(width: size.width / 70),
                                          SvgPicture.asset(
                                            AssetsData.purbleBox,
                                            width: 7.w,
                                          ),
                                          SizedBox(width: size.width / 50),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 20),
                                  Container(
                                    width: 70.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'اسم المورد : ${state.invoice.supplierName}',
                                              textDirection: TextDirection.rtl,
                                              style: Styles.textStyle4Sp,
                                              overflow: TextOverflow.clip,
                                              maxLines: 1,
                                            ),
                                          ),
                                          SizedBox(width: size.width / 70),
                                          Flexible(
                                            child: Icon(
                                              Icons.person_outline_sharp,
                                              size: 9.w,
                                              color: AppColors.deepPurple,
                                            ),
                                          ),
                                          SizedBox(width: size.width / 50),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 70.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'تم تحديد موعد التسليم ${state.invoice.payableAt}',
                                        style: Styles.textStyle4Sp,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 70.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${state.invoice.amount} \$  دولار',
                                        style: Styles.textStyle4Sp,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 70.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'رقم الاستلام: ${state.invoice.invoiceNumber}',
                                        style: Styles.textStyle4Sp,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 70.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'اسم العميل : ${state.invoice.name}',
                                        style: Styles.textStyle4Sp,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 30),
                                  Container(
                                    width: 70.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        cornerRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'رقم العميل : ${state.invoice.phone}',
                                        style: Styles.textStyle4Sp,
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height / 10),
                                  Text(
                                    'رمز الزبون : ${state.invoice.customerCode} ',
                                    style: Styles.textStyle5Sp,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: size.height / 10),
                                  Text(
                                    'الضريبة : ${state.invoice.taxAmount}',
                                    style: Styles.textStyle5Sp,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: size.height / 10),
                                  Text(
                                    'المبلغ الكلي : ${state.invoice.totalAmount}',
                                    style: Styles.textStyle5Sp,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is GetInvoicesLoading) {
              return CustomProgressIndicator();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
