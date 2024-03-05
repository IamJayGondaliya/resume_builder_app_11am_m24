import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/pages/home_page/home_page.dart';
import 'package:resume_builder_app/pages/splach_screen/splash_screen.dart';
import 'package:resume_builder_app/utils/route_utils.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // //Status bar & Navigation bar
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     //Android
  //     statusBarColor: Colors.blue,
  //     //iOS
  //     statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //     //Navigation bar
  //     systemNavigationBarColor: Colors.blue,
  //   ),
  // );
  //
  // //Orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   // DeviceOrientation.portraitDown,
  //   // DeviceOrientation.landscapeLeft,
  //   // DeviceOrientation.landscapeRight,
  // ]);  // WidgetsFlutterBinding.ensureInitialized();
  //
  // //Status bar & Navigation bar
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     //Android
  //     statusBarColor: Colors.blue,
  //     //iOS
  //     statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //     //Navigation bar
  //     systemNavigationBarColor: Colors.blue,
  //   ),
  // );
  //
  // //Orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   // DeviceOrientation.portraitDown,
  //   // DeviceOrientation.landscapeLeft,
  //   // DeviceOrientation.landscapeRight,
  // ]);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.homePage: (context) => const HomePage(),
      },
    );
  }
}
