import 'package:dartz/dartz.dart';
import 'package:subul_manager_dashboard/core/errors/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call([P params]);
}

class NoParam {}