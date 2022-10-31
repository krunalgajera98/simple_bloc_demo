import 'package:demo_block/Screen/Home/Page/home_screen.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_bloc.dart';
import 'package:demo_block/Screen/Increment-Decrement/Page/in_dec_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InDecBloc>(
      create: (context) => InDecBloc(),
      child: const DemoBlocApp(),
    );
  }
}

class DemoBlocApp extends StatefulWidget {
  const DemoBlocApp({Key? key}) : super(key: key);

  @override
  State<DemoBlocApp> createState() => _DemoBlocAppState();
}

class _DemoBlocAppState extends State<DemoBlocApp> {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return BlocProvider<InDecBloc>.value(
                    value: _inDecBloc,
                    child: const InDecScreen(),
                  );
                }));
              },
              child: const Text('Increment-Decrement demo'),
            ),
          ],
        ),
      ),
    );
  }
}
