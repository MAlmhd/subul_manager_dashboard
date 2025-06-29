class BillEntity {
  final int idOfCustomer;
  final int idOfShipment;
  final String numberOfInvoice;
  final int amount;
  final bool isIncludTax;
  final double amountOfTax;
  final double totalAmount;
  final String dateOfPay;
  final String status;
  final int id;
  
  BillEntity({
    required this.idOfCustomer,
    required this.idOfShipment,
    required this.numberOfInvoice,
    required this.amount,
    required this.isIncludTax,
    required this.amountOfTax,
    required this.totalAmount,
    required this.dateOfPay,
    required this.status,
    required this.id,
   
  });
}
