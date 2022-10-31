import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future call(Params params);
  // Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoReturn<Params> {
  call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
