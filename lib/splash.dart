import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/page/home_page.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _controller.forward().whenComplete(() {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.deepPurple[300], // Set your desired background color here
        ),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_ml0yft0o.json',
            ),
          ),
        ),
      ),
    );
  }
}
