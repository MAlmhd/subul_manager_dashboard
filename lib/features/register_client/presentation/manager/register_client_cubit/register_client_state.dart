part of 'register_client_cubit.dart';

sealed class RegisterClientState extends Equatable {
  const RegisterClientState();

  @override
  List<Object> get props => [];
}

final class RegisterClientInitial extends RegisterClientState {}

final class RegisterClientFailure extends RegisterClientState {
  final String message;

  const RegisterClientFailure(this.message);
}

final class RegisterClientLoading extends RegisterClientState {}

final class RegisterClientSuccess extends RegisterClientState {
  final RegisterClientEntity registerClientEntity;

  const RegisterClientSuccess(this.registerClientEntity);
}
