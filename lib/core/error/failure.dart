import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object>  get props => [message];
}



// because iam making implement for Exception, i cant extend from Failure class, so should make another 2 classes
class ServerFailure extends Failure{
  const ServerFailure(super.message);
}
class DatabaseFailure extends Failure{
  const DatabaseFailure(super.message);
}