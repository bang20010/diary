import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase_StorageApp{
  final CollectionReference userInstance = FirebaseFirestore.instance.collection("User");

  getUserData(){
    return userInstance;
  }
}