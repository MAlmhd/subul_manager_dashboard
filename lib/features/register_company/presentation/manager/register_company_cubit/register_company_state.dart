part of 'register_company_cubit.dart';

sealed class RegisterCompanyState extends Equatable {
  const RegisterCompanyState();

  @override
  List<Object> get props => [];
}

final class RegisterCompanyInitial extends RegisterCompanyState {}

final class RegisterCompanyFailure extends RegisterCompanyState {
  final String message;

  const RegisterCompanyFailure(this.message);
}

final class RegisterCompanyLoading extends RegisterCompanyState {}

final class RegisterCompanySuccess extends RegisterCompanyState {
  final RegisterCompanyEntity registerCompanyEntity;

  const RegisterCompanySuccess(this.registerCompanyEntity);
}
