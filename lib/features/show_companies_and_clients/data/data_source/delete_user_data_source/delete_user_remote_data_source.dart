import 'package:subul_manager_dashboard/core/data/auth_local_data_source.dart';
import 'package:subul_manager_dashboard/core/utils/api_service.dart';
import 'package:subul_manager_dashboard/core/utils/service_locator.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/data/models/delete_user_model/delete_user_model.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/delete_user_entity/delete_user_entity.dart';

abstract class DeleteUserRemoteDataSource {
  Future<DeleteUserEntity> deleteUser({required int id});
}

class DeleteUserRemoteDataSourceImpl implements DeleteUserRemoteDataSource {
  final ApiService _apiService;

  DeleteUserRemoteDataSourceImpl(this._apiService);
  @override
  Future<DeleteUserEntity> deleteUser({required int id}) async {
    final token = await sl.get<AuthLocalDataSource>().getToken();
    var data = await _apiService.delete(
      endPoint: 'delete/Customer/$id',
      headers: {'Authorization': 'Bearer $token'},
    );

    DeleteUserEntity deleteUserEntity = DeleteUserModel.fromJson(data);
    return deleteUserEntity;
  }
}
