import 'dart:developer';

import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/data/models/get_invoices_model/get_invoices_model.dart';
import 'package:subul_manager_dashboard/features/track_shipments_home/domain/entities/get_ivoices_entity/get_invoices_entity.dart';

abstract class GetInvoicesRemoteDataSource {
  Future<GetInvoicesEntity> getInvoices({required int id});
}

class GetInvoicesRemoteDataSourceImpl implements GetInvoicesRemoteDataSource {
  final ApiService _apiService;

  GetInvoicesRemoteDataSourceImpl(this._apiService);
  @override
  Future<GetInvoicesEntity> getInvoices({required int id}) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();

    var data = await _apiService.get(
      endPoint: 'get/invoice/$id',
      headers: {'Authorization': 'Bearer $token'},
    );

    log("$data");

    GetInvoicesEntity invoice = GetInvoicesModel.fromJson(data);

    return invoice;
  }
}
