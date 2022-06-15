import 'dart:math';

import 'package:diplopm_2/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  String? error = '';

  Future<NewUser?> signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential ressult= await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      User? user = _fAuth.currentUser;
      return NewUser.fromFirebase(user!);
    }catch(e){
      return null;
    }
  }

  Future<NewUser?> registerInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential ressult= await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = _fAuth.currentUser;
      return NewUser.fromFirebase(user!);
    }catch(e){
      return null;
    }
  }

  Future logOut() async{
    await _fAuth.signOut();
  }

   // Stream<NewUser?> get currentUser{
   //  return _fAuth.authStateChanges.map((User user ) => user !=null ? NewUser.fromFirebase(user) : null);
   //  // return _fAuth.authStateChanges.map((User user ) => user !=null ? NewUser.fromFirebase(newUser) : null);
   // }
}