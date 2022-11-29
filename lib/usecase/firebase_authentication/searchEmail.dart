import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/utility/firebase_authentication.dart';
import 'package:market/utility/firebase_firestore.dart';

Future SearchEmail(String email) async {
  String getEmail = "";
  Firebase_FireStoreApp().getFireStoreInstance().get().then((snapshot) {
    snapshot.docs.forEach((doc) {
      if (doc.id.contains(email)) {
        final getDoc = doc.id.split("_");
        getEmail = getEmail[0];
      }
    });
  });

  if(getEmail.isNotEmpty){
    return getEmail;
  }
  else{
    return "";
  }
  // await Firebase_AuthenticationApp()
  //     .getAuthentication()
  //     .authStateChanges()
  //     .listen((User? user) {})
  //     .then((value) {}, onError: (e) {
  //   return {"result": false, "error": e};
  // });
}
