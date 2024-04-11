import 'package:flutter/material.dart';
import 'package:password_gen/app/features/presentation/pages/home/ui/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future initaialfun(context) async {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Home(),
      ));
    }

    initaialfun(context);

    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
          child: Image.asset(
        "asset/icons8-lock-400(-xxxhdpi).png",
        fit: BoxFit.fill,
        height: 150,
      )),
    );
  }
}
