import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';
import 'package:subul_manager_dashboard/core/use_cases/use_case.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/entites/sign_in_entity.dart';
import 'package:subul_manager_dashboard/features/sign_in/domain/repos/sign_in_repo.dart';

class SignInUseCase extends UseCase<SignInEntity, SignInParams> {
  final SignInRepo signInRepo;

  SignInUseCase(this.signInRepo);

  @override
  Future<Either<Failure, SignInEntity>> call([SignInParams? params]) async {
   
    return await signInRepo.signIn(
      email: params!.email,
      password: params.password,
    );
  }
}




class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
