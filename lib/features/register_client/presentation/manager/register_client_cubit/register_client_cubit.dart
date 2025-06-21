import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/entites/basic_response_entity/basic_response_entity.dart';
import 'package:subul_manager_dashboard/features/register_client/domain/use_cases/register_client_use_case.dart';

part 'register_client_state.dart';

class RegisterClientCubit extends Cubit<RegisterClientState> {
  RegisterClientCubit(this.registerClientUseCase)
    : super(RegisterClientInitial());
  final RegisterClientUseCase registerClientUseCase;

  Future<void> registerClient({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required String address,
    required String timeZone,
    required XFile prophilePhoto,
    required XFile identityPhoto,
    required int idCompany,
  }) async {
    emit(RegisterClientLoading());
    RegisterClientParams registerClientParams = RegisterClientParams(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      phone: phone,
      gender: gender,
      address: address,
      timeZone: timeZone,
      prophilePhoto: prophilePhoto,
      identityPhoto: identityPhoto,
      idCompany: idCompany,
    );
    var result = await registerClientUseCase.call(registerClientParams);

    result.fold(
      (failure) {
        emit(RegisterClientFailure(failure.message));
      },
      (success) {
        emit(RegisterClientSuccess(success));
      },
    );
  }
}
