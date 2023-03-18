import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _gotohome();
  }

  _gotohome() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 0, 180, 137),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Image.asset('assets/images/cricbuzz_op.png'),
          ),
        ));
  }
}
