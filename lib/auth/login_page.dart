import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? login = '';
  String? password = '';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future singlIn() async {
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) => const Center(
      //           child: CircularProgressIndicator(),
      //         ));

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: backgroundWhite,
          ),
          width: 600,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text('Логин'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(),
                        onChanged: (String? value) {
                          setState(() {
                            login = value;
                          });
                        },
                      ),
                    ),
                    const Text('Пароль'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(),
                        onChanged: (String? value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ElevatedButton(
                            onPressed: () {
                              singlIn();
                            },
                            child: const Text(
                              'Войти',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
