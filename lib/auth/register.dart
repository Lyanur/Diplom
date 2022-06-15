import 'package:diplopm_2/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class RegisterPage extends StatefulWidget {
  final Function() onClickedSingIn;
  const RegisterPage({
    Key? key,
    required this.onClickedSingIn,
  }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future singUp() async {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route) => route)
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
                    const Text('Создайте логин'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: TextFormField(
                        validator: (email) => email != null&& !EmailValidator.validate(email) ? 'Проверьте правлиьность ':null,
                        controller: emailController,
                        decoration: const InputDecoration(),
                      ),
                    ),
                    const Text('Создайте пароль'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(),
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
                              singUp();
                            },
                            child: const Text(
                              'Зарегистрироваться',
                            ),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Есть аккаунта?',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSingIn,
                            text: 'войдите в него его',
                            style: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
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
