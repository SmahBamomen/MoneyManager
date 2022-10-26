import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? documentId;
  late double salary;

  UserModel({
    required this.salary,
  });

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    salary = documentSnapshot["salary"];
  }
}