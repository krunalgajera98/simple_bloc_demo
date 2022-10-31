import 'package:demo_block/Screen/Spash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Helper/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initMySharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
//https://github.com/krunalgajera98/simple_bloc_demo.git