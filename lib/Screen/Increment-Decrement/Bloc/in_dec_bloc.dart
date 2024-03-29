import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_event.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InDecBloc extends Bloc<InDecEvent, InDecState> {
  InDecBloc() : super(const InDecInitial(index: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterState(val: (state.index) + 1));
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(CounterState(val: (state.index) - 1));
    });
    on<ResetCounterEvent>((event, emit) {
      emit(const CounterState(val: 0));
    });
    on<LongPressCounterEvent>((event, emit) {
      emit(const CounterState(val: 50));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
