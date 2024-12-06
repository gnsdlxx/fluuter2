import 'package:flutter/material.dart';
import 'dart:async'; // Timer를 사용하기 위해 추가
import 'package:exam1/ui/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      initialRoute: '/splash', // 처음에 SplashScreen을 보여줌
      routes: {
        '/splash': (context) => const SplashScreen(), // SplashScreen 경로
        '/login': (context) => const LoginPage(), // 로그인 페이지 경로
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후에 LoginPage로 이동
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/login'); // '/login' 경로로 이동
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // 로고 경로
          height: 450,
        ),
      ),
    );
  }
}
