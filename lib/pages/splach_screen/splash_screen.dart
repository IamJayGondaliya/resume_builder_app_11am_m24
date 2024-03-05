import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/route_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () {
    //     Navigator.pushReplacementNamed(
    //       context,
    //       MyRoutes.homePage,
    //     );
    //   },
    // );

    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.pushReplacementNamed(
          context,
          MyRoutes.homePage,
        );
        tick.cancel();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
