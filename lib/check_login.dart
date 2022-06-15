import 'package:diplopm_2/auth/login_page.dart';
import 'package:diplopm_2/homePage.dart';
import 'package:diplopm_2/main.dart';
import 'package:diplopm_2/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(nameApp),
      ),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError){
            return const Center(child: Text('произошла ошибка'),);
            } else if (snapshot.hasData) {
              return const MyHomePage();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
