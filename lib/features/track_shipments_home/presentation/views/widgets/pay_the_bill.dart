import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subul_manager_dashboard/core/helpers/assets_data.dart';
import 'package:subul_manager_dashboard/core/helpers/constants.dart';
import 'package:subul_manager_dashboard/core/helpers/styles.dart';
import 'package:subul_manager_dashboard/core/theming/app_colors.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/custom_radio.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/presentation/views/widgets/square_price.dart';

class PayTheBill extends StatefulWidget {
  const PayTheBill({
    super.key,
    required this.onTap,
    required this.showDetailsOfBill,
    required this.showBillFile,
    required this.showDetailsofBillWidget,
  });
  final Function() onTap;

  final bool showBillFile;
  final bool showDetailsOfBill;
  final Function() showDetailsofBillWidget;

  @override
  State<PayTheBill> createState() => _PayTheBillState();
}

class _PayTheBillState extends State<PayTheBill> {
  bool isTaxIncluded = true;

  TextEditingController priceController = TextEditingController();
  int selectedPrice = 100;

  void selectPrice(int price) {
    setState(() {
      selectedPrice = price;
      priceController.text = price.toString();
    });
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'الرجاء تحديد إذا كانت الشحنة تشمل ضرائب أم لا',
                    style: Styles.textStyle4Sp,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: size.width / 50),
                SvgPicture.asset(AssetsData.purbleBox, width: 9.w),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'تشمل الضريبة؟',
                    style: Styles.textStyle4Sp,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                //  SizedBox(width: size.width / 160),
                Switch(
                  value: isTaxIncluded,
                  onChanged: (value) {
                    setState(() {
                      isTaxIncluded = value;
                    });
                  },
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.deepPurple,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child:
                widget.showBillFile
                    ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: widget.showDetailsofBillWidget,
                        child: Container(
                          width: 60.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.deepPurple,
                            borderRadius: BorderRadius.circular(cornerRadius),
                          ),
                          child: Center(
                            child: Text(
                              'عرض ملف الفاتورة',
                              style: Styles.textStyle3Sp.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: widget.onTap,
                            child: Container(
                              width: 20.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: AppColors.deepPurple,
                                borderRadius: BorderRadius.circular(
                                  cornerRadius,
                                ),
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

                        Expanded(
                          child: Text(
                            'هل يمكن دفع الفاتورة الان؟',
                            style: Styles.textStyle4Sp.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                          ),
                        ),
                        CustomRadio(isSelected: true),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
