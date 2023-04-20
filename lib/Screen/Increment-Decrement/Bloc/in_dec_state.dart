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

class CounterState extends InDecState {
  final int val;

  const CounterState({required this.val}) : super(index: val);

  @override
  List<Object> get props => [val];
}
