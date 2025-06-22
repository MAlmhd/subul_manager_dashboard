part of 'delete_user_cubit.dart';

sealed class DeleteUserState extends Equatable {
  const DeleteUserState();

  @override
  List<Object> get props => [];
}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserFailure extends DeleteUserState {
  final String message;

  const DeleteUserFailure(this.message);
}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserSuccess extends DeleteUserState {
  final DeleteUserEntity deleteUserEntity;

  const DeleteUserSuccess(this.deleteUserEntity);
}
