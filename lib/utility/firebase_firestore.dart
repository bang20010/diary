import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase_FireStoreApp{
  final CollectionReference instance = FirebaseFirestore.instance.collection("User");

  getFireStoreInstance(){
    return instance;
  }
}