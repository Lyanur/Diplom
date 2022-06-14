import 'package:flutter/material.dart';

import '../strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? login='';
  String? password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(nameApp),
      ),
      backgroundColor: Colors.white,
      body: Padding(
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
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              login=value;
                            });
                          },
                        ),
                      ),
                      const Text('Пароль'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              password=value;
                            });
                          },
                        ),
                      ),
                  SizedBox(
                    width: 200,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                          onPressed: () {
                            print(login);
                            print(password);
                            Navigator.pushNamed(context, '/home');
                          },
                          child: const Text(
                            'Отправить',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                    ],
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
