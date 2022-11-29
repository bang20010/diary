import 'package:firebase_auth/firebase_auth.dart';

class Firebase_AuthenticationApp {
  final FirebaseAuth instance = FirebaseAuth.instance;

  getAuthentication() {
    return instance;
  }
}