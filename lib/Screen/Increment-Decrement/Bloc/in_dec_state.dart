import 'package:equatable/equatable.dart';

abstract class InDecState extends Equatable {
  final int index;

  const InDecState({this.index = 0});

  @override
  List<Object?> get props => [];
}

class InDecInitial extends InDecState {
  const InDecInitial({required super.index});

  @override
  List<Object?> get props => [];
}

class CounterIncrementState extends InDecState {
  final int val;

  const CounterIncrementState({required this.val}) : super(index: val);

  @override
  List<Object> get props => [val];
}

class CounterDecrementState extends InDecState {
  final int val;

  const CounterDecrementState({required this.val}) : super(index: val);

  @override
  List<Object> get props => [val];
}

class CounterResetState extends InDecState {
  final int val;

  const CounterResetState({required this.val}) : super(index: val);

  @override
  List<Object> get props => [val];
}

class CounterLongPressState extends InDecState {
  final int val;

  const CounterLongPressState({required this.val}) : super(index: val);

  @override
  List<Object> get props => [val];
}
