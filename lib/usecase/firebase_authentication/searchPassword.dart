import 'package:market/utility/firebase_authentication.dart';

Future SearchPassword(String email) async {
  Firebase_AuthenticationApp()
      .getAuthentication()
      .sendPasswordResetEmail(email)
      .then((value) {
    return true;
  }, onError: (e) {
    return false;
  });
}
