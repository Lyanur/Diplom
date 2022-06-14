import 'package:diplopm_2/Login/login_page.dart';
import 'package:diplopm_2/main.dart';
import 'package:diplopm_2/strings.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bool isLoggedIn = false;
    return isLoggedIn ? const MyHomePage(title: nameApp,) : const LoginPage();
  }
}
