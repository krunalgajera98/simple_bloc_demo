import 'package:demo_block/Helper/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../demo_bloc_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> getToken() async {
    SharedPrefs.saveToken('token');
    String token = await SharedPrefs.getToken();
    await Future.delayed(const Duration(seconds: 3));
    if (token != '') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Test()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User Not Exist!'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
