import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_approve_shipment_entity/response_of_approve_shipment_entity.dart';

class ResponseOfApproveShipmentModel extends ResponseOfApproveShipmentEntity{
	bool? success;
	int? status;
	String? message2;
	dynamic data;

	ResponseOfApproveShipmentModel({
		this.success, 
		this.status, 
		this.message2, 
		this.data, 
	}) : super(message2!);

	factory ResponseOfApproveShipmentModel.fromJson(Map<String, dynamic> json) {
		return ResponseOfApproveShipmentModel(
			success: json['success'] as bool?,
			status: json['status'] as int?,
			message2: json['message'] as String?,
			data: json['data'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message2,
				'data': data,
			};
}
