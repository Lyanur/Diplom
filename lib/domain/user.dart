import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NewUser {
  String? id;
  String? error;
  NewUser.fromFirebase(User user){
    id = user.uid;
  }
}