import 'package:subul_manager_dashboard/features/get_unapproved_shipments/domain/entities/response_of_reject_shipment_entity/response_of_reject_shipment_entity.dart';

import 'data.dart';

class ResponseOfRejectShipmentModel extends ResponseOfRejectShipmentEntity{
	bool? success;
	int? status;
	String? message2;
	Data? data;

	ResponseOfRejectShipmentModel({
		this.success, 
		this.status, 
		this.message2, 
		this.data, 
	}) : super(message2!);

	factory ResponseOfRejectShipmentModel.fromJson(Map<String, dynamic> json) {
		return ResponseOfRejectShipmentModel(
			success: json['success'] as bool?,
			status: json['status'] as int?,
			message2: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message2,
				'data': data?.toJson(),
			};
}
