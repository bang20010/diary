import 'package:market/utility/firebase_firestore.dart';

import '../../../model/user.dart';

// fireStore에 있는 데이터를 추가하는 함수 null 반횐시 유저 데이터정보가 들어가지 않았다는 오류
Future addUser(
  String email,
  String password,
  String address,
  String phoneNumber,
  String nicName,
  String signinDate,
) async {
  String document = email + "_" + phoneNumber;
  return await Firebase_FireStoreApp()
      .getFireStoreInstance()
      .doc(document)
      .set(UserData(
              Email: email,
              Password: password,
              Address: address,
              PhoneNumber: phoneNumber,
              NicName: nicName,
              SignInDate: signinDate)
          .toJson())
      .then(
    onError: (e) {
      return {"result": false, "error": e};
    },
  );
}
