import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options/personal_info_page/personal_info_page.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options/technical_skills_page/technical_skills_page.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options_page.dart';
import 'package:resume_builder_app/pages/home_page/home_page.dart';
import 'package:resume_builder_app/pages/splach_screen/splash_screen.dart';
import 'package:resume_builder_app/utils/route_utils.dart';

void main() {
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
      routes: MyRoutes.routes,
    );
  }
}
