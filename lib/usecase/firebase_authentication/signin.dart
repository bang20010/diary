import 'package:market/utility/firebase_authentication.dart';

Future SignIn(String email, String password) async{
  await Firebase_AuthenticationApp().getAuthentication().signInWithEmailAndPassword(email: email, password: password)
      .then(
    (doc) {
      return {"result": true, "docid": doc};
    },
    onError: (e) {
      return {"result": false, "error": e};
    },
  );
}