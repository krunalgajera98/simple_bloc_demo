import 'package:demo_block/Screen/Home/Page/home_screen.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_bloc.dart';
import 'package:demo_block/Screen/Increment-Decrement/Page/in_dec_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InDecBloc>(
      create: (context) => InDecBloc(),
      child: const _DashBoard(),
    );
  }
}

class _DashBoard extends StatefulWidget {
  const _DashBoard({Key? key}) : super(key: key);

  @override
  State<_DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<_DashBoard> {
  late InDecBloc _inDecBloc;

  @override
  void initState() {
    super.initState();
    _inDecBloc = BlocProvider.of<InDecBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyHomePage()));
              },
              child: const Text('HomePage'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return BlocProvider<InDecBloc>.value(
                      value: _inDecBloc,
                      child: const InDecScreen(),
                    );
                  }),
                );
              },
              child: const Text('Increment-Decrement Page'),
            ),
          ],
        ),
      ),
    );
  }
}
