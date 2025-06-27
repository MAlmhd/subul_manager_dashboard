class BillEntity {
  final String idOfCustomer;
  final String idOfShipment;
  final String numberOfInvoice;
  final String amount;
  final String isIncludTax;
  final String amountOfTax;
  final num totalAmount;
  final String dateOfPay;
  final String status;

  BillEntity({required this.idOfCustomer,required this.idOfShipment,required this.numberOfInvoice,required this.amount,required this.isIncludTax,required this.amountOfTax,required this.totalAmount,required this.dateOfPay,required this.status});
}


