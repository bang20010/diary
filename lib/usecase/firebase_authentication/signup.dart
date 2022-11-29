import 'package:market/utility/firebase_authentication.dart';

Future SignUp(String email, String password) async {
  await Firebase_AuthenticationApp()
      .getAuthentication()
      .createUserWithEmailAndPassword(email, password)
      .then((value) {}, onError: (e) {
    return {"result": false, "error": e};
  });
}
