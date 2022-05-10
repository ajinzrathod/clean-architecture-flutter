import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  var properties;

  Failure([List properties = const<dynamic>[]]);

  @override
  List<Object> get props => [properties];
}


// General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}