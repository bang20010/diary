import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:market/data/datasource/alertfunction.dart';

import '../../model/user.dart';

class UserData{
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("User");

  Future AddUser(
    BuildContext context,
    String email,
    String password,
    String address,
    String phoneNumber,
    String nicName,
    String signinDate,
  )async{
    bool CheckEmail = CheckEqualEmail(context, email);

    if(CheckEmail){
      return await userCollection.doc(email).collection("Data").doc(phoneNumber).set(User(
        Email: email,
        Password: password,
        Address: address,
        PhoneNumber: phoneNumber,
        NicName: nicName,
        SignInDate: signinDate
      ).toJson()).then((value) => AlertFunction().alertAddUser(context, "${email}님의 회원가입이 완료되었습니다."));
    }else{
      return;
    }
  }
  
    Future upadateUser(
    BuildContext context,
    String email,
    String password,
    String address,
    String phoneNumber,
    String nicName,
    String signinDate,
  )async{
    if(email.isNotEmpty){
    final CollectionReference userUpdateCollection = userCollection.doc(email).collection("Data");
      return await userUpdateCollection.doc(phoneNumber).update(User(
        Email: email,
        Password: password,
        Address: address,
        PhoneNumber: phoneNumber,
        NicName: nicName,
        SignInDate: signinDate
      ).toJson()).then((value) => AlertFunction().alertAddUser(context, "${email}님의 정보가 수정되었습니다."));
    }else{
      AlertFunction().errorAlert(context, "로그인 상태가 아닙니다 다시 로그인 해주세요");
      return;
    }
  }
  bool CheckEqualEmail(BuildContext context, String email){
    
    bool rtnValue = false;

    userCollection.get().then((snapshot) => {
      snapshot.docs.forEach((doc) { 
        if(doc.id == email){
          rtnValue = true;
        }
      }),
    });

    if(rtnValue){
      return rtnValue;
    }
    else{
      AlertFunction().errorAlert(context, "존재하는 이메일입니다. 다른 이메일을 입력해주시길 바랍니다.");
      return rtnValue;
    }
  }
}