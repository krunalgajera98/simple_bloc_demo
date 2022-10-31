import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_bloc.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_event.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InDecScreen extends StatelessWidget {
  const InDecScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///when find bloc
    return InDecScreenView();

    ///when create bloc
    return BlocProvider(
      create: (_) => InDecBloc(),
      child: InDecScreenView(),
    );
  }
}

class InDecScreenView extends StatefulWidget {
  @override
  State<InDecScreenView> createState() => _InDecScreenViewState();
}

class _InDecScreenViewState extends State<InDecScreenView> {
  late InDecBloc _inDecBloc;

  @override
  void initState() {
    super.initState();
    _inDecBloc = BlocProvider.of<InDecBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<InDecBloc, InDecState>(
              builder: (context, state) {
                print('state ==> $state');
                if (state is InDecInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CounterIncrementState ||
                    state is CounterDecrementState ||
                    state is CounterLongPressState ||
                    state is CounterResetState) {
                  print('state ==> ${state.index}');
                  return Center(
                    child: Text('index: ${state.index}'),
                  );
                }
                return const Center(
                  child: Text('No Data Available!'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _inDecBloc.add(IncrementCounterEvent());
                },
                child: const Icon(Icons.exposure_plus_1),
              ),
              ElevatedButton(
                onPressed: () {
                  _inDecBloc.add(ResetCounterEvent());
                },
                onLongPress: () {
                  _inDecBloc.add(LongPressCounterEvent());
                },
                child: const Icon(Icons.refresh),
              ),
              ElevatedButton(
                onPressed: () {
                  _inDecBloc.add(DecrementCounterEvent());
                },
                child: const Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
