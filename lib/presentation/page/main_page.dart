import 'package:flutter/material.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/network/appwrite_service.dart';
import 'package:learning_english_web/presentation/page/home/home_page.dart';
import 'package:learning_english_web/presentation/page/login/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final loginStatus = await server.checkLoginStatus();

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => loginStatus == StatusApp.bypassLogin ? const HomePage() : const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}