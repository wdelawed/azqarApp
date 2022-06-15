import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({this.message = ""});
  @override
  List<Object?> get props => [message];
}

class DataBaseFailure extends Failure {}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}
