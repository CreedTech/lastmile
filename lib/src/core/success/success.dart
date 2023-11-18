import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  List<Object> get props => [];
}
class Succesful extends Success {
  final String message;

  Succesful({required this.message});
  @override
  List<Object> get props => [message];
}