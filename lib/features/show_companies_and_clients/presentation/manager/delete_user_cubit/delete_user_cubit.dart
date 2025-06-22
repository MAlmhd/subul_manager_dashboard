import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/entities/delete_user_entity/delete_user_entity.dart';
import 'package:subul_manager_dashboard/features/show_companies_and_clients/domain/use_case/delete_user_use_case/delete_user_use_case.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this.deleteUserUseCase) : super(DeleteUserInitial());
  final DeleteUserUseCase deleteUserUseCase;

  Future<void> deleteUser({required int id}) async {
    emit(DeleteUserLoading());

    var result = await deleteUserUseCase.call(id);

    result.fold(
      (failure) {
        emit(DeleteUserFailure(failure.message));
      },
      (success) {
        emit(DeleteUserSuccess(success));
      },
    );
  }
}
