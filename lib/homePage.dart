import 'package:diplopm_2/new_form.dart';
import 'package:diplopm_2/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  Future logOut() async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ваших заявок пока что нет потому что разрабочки линив и не пишет их',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(user.email!,),
            ElevatedButton(
              onPressed: () {
                logOut();
              },
              child: const Text(
                'Выйти из аккаунта',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

