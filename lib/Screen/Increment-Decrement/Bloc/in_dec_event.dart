import 'package:equatable/equatable.dart';

abstract class InDecEvent extends Equatable {
  const InDecEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends InDecEvent {}

class DecrementCounterEvent extends InDecEvent {}

class ResetCounterEvent extends InDecEvent {}

class LongPressCounterEvent extends InDecEvent {}
