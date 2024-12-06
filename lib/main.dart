import 'package:exam1/ui/pages/SplashScreen.dart';
import 'package:exam1/ui/pages/Myprofile_page.dart';
import 'package:exam1/ui/pages/login_page.dart';
import 'package:exam1/ui/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:exam1/ui/pages/MyprofileSetting_page.dart';
import 'package:exam1/ui/pages/PostEditPage.dart';
import 'package:exam1/ui/pages/kakaomap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: kDebugMode
          ? const LoginPage()
          : const SplashScreen(), // SplashScreen을 홈으로 설정
    );
  }
}
