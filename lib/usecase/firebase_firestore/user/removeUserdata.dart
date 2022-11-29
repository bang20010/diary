import 'package:market/utility/firebase_storage.dart';

Future DelteUserData(String email, String password) async {
  String document = email + "_" + password;
  await Firebase_StorageApp().getUserData().doc(document).delete().then((value){},
  onError: (e) {
      return {"result": false, "error": e};
    });
}
