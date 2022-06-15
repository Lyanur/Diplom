import 'package:diplopm_2/auth/login_page.dart';
import 'package:diplopm_2/auth/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(
          onClickedSingUp: toggle,
        )
      : RegisterPage(
          onClickedSingIn: toggle,
        );
  void toggle() => setState(() => isLogin =!isLogin);
}
