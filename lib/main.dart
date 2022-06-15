
import 'package:diplopm_2/homePage.dart';
import 'package:diplopm_2/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login_page.dart';
import 'check_login.dart';
import 'new_form.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckLogin(),
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => const LoginPage(),
        '/home': (BuildContext context) => const MyHomePage(),
        '/newForm': (BuildContext context) => const NewForm(),
      },
      // home: const NewForm(),
    );
  }
}


