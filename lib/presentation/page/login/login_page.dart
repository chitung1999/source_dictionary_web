import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/presentation/page/home/home_page.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';
import 'package:learning_english_web/network/appwrite_service.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isHidePassword = true;

  Future onLogin() async {
    final result = await server.login(email: _username.text, password: _password.text);
    if (!mounted) return;
    if (result == StatusApp.loginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );

    } else {
      ToastMessage.show(context, StatusApp.loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    double wScreen = MediaQuery.of(context).size.width;
    double hScreen = MediaQuery.of(context).size.height;
    double wMaxDialog = 400;
    double hDialog = 380;
    double spacing = 10;
    double wDialog = wScreen > (wMaxDialog + spacing * 2) ? wMaxDialog : (wScreen - spacing * 2);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ColorConstants.bg1,
          padding: EdgeInsets.symmetric(
            horizontal: (wScreen-wDialog) / 2,
            vertical: hScreen > (hDialog + spacing * 2) ? (hScreen - hDialog) / 2 : spacing,
          ),
          child: Container(
            width: wDialog,
            height: hDialog,
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: ColorConstants.bg3,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 30,
              children: [
                const Text(
                    'Learning English',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: ColorConstants.white)
                ),
                TextField(
                  controller: _username,
                  style: const TextStyle(fontSize: 20, color: ColorConstants.white),
                  decoration: InputDecoration(
                    hintText: 'User name',
                    hintStyle: TextStyle(fontSize: 20, color: ColorConstants.hint
                    ),
                    icon: const Icon(Icons.person, color: ColorConstants.hint)
                  ),
                ),
                TextField(
                  controller: _password,
                  obscureText: _isHidePassword,
                  style: const TextStyle(fontSize: 20, color: ColorConstants.white),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 20, color: ColorConstants.hint
                    ),
                    icon: const Icon(Icons.lock, color: ColorConstants.hint),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility, color: ColorConstants.hint),
                      onPressed: () {
                        setState(() {_isHidePassword = !_isHidePassword;});
                      }
                    )
                  ),
                ),
                const SizedBox(),
                TextButtonApp.primary(
                    text: 'Login',
                    textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorConstants.black),
                    width: double.infinity,
                    height: 50,
                    radius: 5,
                    bgColor: ColorConstants.white,
                    onPressed: onLogin
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
