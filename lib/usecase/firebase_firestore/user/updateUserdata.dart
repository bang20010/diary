  import 'package:market/utility/firebase_firestore.dart';

import '../../../../model/user.dart';

// fireStore에 있는 데이터를 업데이트 하는 함수 
Future upadateUser(
    String email,
    String password,
    String address,
    String phoneNumber,
    String nicName,
    String signinDate,
  )async{
    if(email.isNotEmpty){
      return await Firebase_FireStoreApp().getFireStoreInstance().doc(phoneNumber).update(UserData(
        Email: email,
        Password: password,
        Address: address,
        PhoneNumber: phoneNumber,
        NicName: nicName,
        SignInDate: signinDate
      ).toJson());
    }else{
      return;
    }
  }