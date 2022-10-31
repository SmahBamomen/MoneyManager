import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
// void incomeFunction(double money , String categories ,String purpose ) async{
//   double salary = 0;
//   double incomeCount =0 ;
//
//   await FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).snapshots().listen((event) {
//
//
//      salary = event.get('monthlyBalance');
//
//      print("monthlyBalance"+salary.toString());
//      // double incomeCount = salary + money;
//      // print(incomeCount);
//      // FirebaseFirestore.instance
//      //    .collection('users').doc(auth.currentUser?.uid)
//      //    .update({'monthlyBalance':incomeCount});
//      // addToDB(incomeCount);
//   });
// print(salary);
//   // print(incomeCount);
//   // double incomeCount = salary + money;
//   // print(incomeCount);
//   // FirebaseFirestore.instance
//   //     .collection('users').doc(auth.currentUser?.uid).collection("manager")
//   //     .add({'money':money , 'categories':categories , 'purpose':purpose ,'income':true,'outcome':false});
//   // FirebaseFirestore.instance
//   //     .collection('users').doc(auth.currentUser?.uid)
//   //     .update({'monthlyBalance':incomeCount});
//
//
//
//
//
// }
// void addToDB(double monthlyBalance){
//   FirebaseFirestore.instance
//       .collection('users').doc(auth.currentUser?.uid)
//       .update({'monthlyBalance':monthlyBalance});
// }
// void exposeFunction(){
//
// }
//
// void savingFunction(double salary,double reminder){
//   double saving = salary  * 10 / 100 ;
//   double reminder = salary - saving ;
//
// }
//
// void goalFunction(){
//
// }