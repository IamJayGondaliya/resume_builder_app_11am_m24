import 'package:flutter/material.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options/personal_info_page/personal_info_page.dart';
import 'package:resume_builder_app/pages/build_options_page/build_options/technical_skills_page/technical_skills_page.dart';
import 'package:resume_builder_app/pages/home_page/home_page.dart';
import 'package:resume_builder_app/pages/pdf_page/pdf_page.dart';
import 'package:resume_builder_app/pages/splach_screen/splash_screen.dart';

import '../pages/build_options_page/build_options_page.dart';

class MyRoutes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String buildOptionPage = 'build_option_page';
  static String pdfPage = 'pdf_page';

  static String iconPath = "lib/assets/icons";

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    pdfPage: (context) => const PdfPage(),
    buildOptionPage: (context) => const BuildOptionsPage(),
    buildOptions[0]['route']: (context) => const PersonalInfoPage(),
    buildOptions[5]['route']: (context) => const TechnicalSkillsPage(),
  };

  //BuildOptions
  static List buildOptions = [
    {
      'title': 'Personal info',
      'route': 'personal_info',
      'icon': '$iconPath/details.png',
    },
    {
      'title': 'Education',
      'route': 'education',
      'icon': '$iconPath/education.png',
    },
    {
      'title': 'Experience ',
      'route': 'experience',
      'icon': '$iconPath/experience.png',
    },
    {
      'title': 'Certified courses',
      'route': 'certified_courses',
      'icon': '$iconPath/certificate.png',
    },
    {
      'title': 'Projects ',
      'route': 'projects',
      'icon': '$iconPath/projects.png',
    },
    {
      'title': 'Technical skills',
      'route': 'technical_skills',
      'icon': '$iconPath/skills.png',
    },
    {
      'title': 'Hobbies',
      'route': 'hobbies',
      'icon': '$iconPath/hobbies.png',
    },
    {
      'title': 'About',
      'route': 'about_info',
      'icon': '$iconPath/info.png',
    },
    {
      'title': 'Achievements',
      'route': 'achievements',
      'icon': '$iconPath/achievement.png',
    },
  ];
}
