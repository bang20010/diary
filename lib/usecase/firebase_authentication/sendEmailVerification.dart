import 'package:market/utility/firebase_authentication.dart';

Future SendEmailVaerification(String email) async {
  Firebase_AuthenticationApp()
      .getAuthentication()
      .signInWithEmailLink()
      .then((value) {
        return true;
      }, onError: (e) {
    return false;
  });
}
