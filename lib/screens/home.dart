
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/Widget/custom_icons.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/drop_down.dart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_manager/screens/reports.dart';

import '../constFiles/strings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
return Container();

//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('OPS ! ');
//         } else if (snapshot.hasData || snapshot.data != null) {
//           userName = snapshot.data!["userName"];
//           return CustomBackground(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 100),
//
//
//                 // CustomDisplayName(userName:snapshot.data!["userName"],),
//                 SizedBox(height: 35),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //
//                 //   children: [
//                 //     SizedBox(width: 5),
//                 //     Container(
//                 //       width: 164,
//                 //       height: 81,
//                 //       decoration: BoxDecoration(
//                 //         color: CustomColors.colorLightBlue,
//                 //         border: Border.all( width: 1 ,color:CustomColors.colorGreen ),
//                 //
//                 //         borderRadius: BorderRadius.circular(4),
//                 //       ),
//                 //       child: Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         crossAxisAlignment: CrossAxisAlignment.center,
//                 //         children: [
//                 //           Text("الدخل",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: CustomColors.colorYellow,),),
//                 //           SizedBox(height: 15),
//                 //           Text(snapshot.data!["monthlyBalance"].toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize:24 ,color: CustomColors.colorGreen,),),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     SizedBox(width: 5),
//                 //     Container(
//                 //       width: 164,
//                 //       height: 81,
//                 //       decoration: BoxDecoration(
//                 //         color: CustomColors.colorLightBlue,
//                 //         border: Border.all( width: 1 ,color:CustomColors.colorRed ),
//                 //
//                 //         borderRadius: BorderRadius.circular(4),
//                 //       ),
//                 //       child: Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         crossAxisAlignment: CrossAxisAlignment.center,
//                 //         children: [
//                 //           Text("المصروفات",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: CustomColors.colorYellow,),),
//                 //           SizedBox(height: 15),
//                 //           Text(snapshot.data!["bacicsOutcome"].toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize:24 ,color: CustomColors.colorRed,),),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     SizedBox(width: 5),
//                 //
//                 //   ],),
//                 SizedBox(height: 15),
//                 // Center(
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       color: CustomColors.colorLightBlue,
//                 //       borderRadius: BorderRadius.circular(4),
//                 //     ),
//                 //     height: 43,
//                 //     width:365 ,
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.only(left: 12.0,right: 12.0),
//                 //       child:   Row(
//                 //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //         children: [
//                 //           Text("مدخراتك",style: TextStyle(fontWeight: FontWeight.w700,fontSize:17 ,color: CustomColors.colorYellow,),),
//                 //           Text(snapshot.data!["savingBalance"].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorWhite,),),
//                 //
//                 //         ],),
//                 //     ),
//                 //   ),
//                 // ),
// SizedBox(height: 10),
//                 // StreamBuilder(
//                 //   stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).collection("manager").snapshots(),
//                 //   builder: (context, snapshot) {
//                 //     if (snapshot.hasError) {
//                 //       return Text('OPS ! ');
//                 //     } else if (snapshot.hasData || snapshot.data != null) {
//                 //
//                 //       return   Column(
//                 //         children: [
//                 //           Container(
//                 //             height: 300,
//                 //             child: ListView.builder(
//                 //                 scrollDirection: Axis.horizontal,
//                 //                 itemCount:    snapshot.data!.docs.length,
//                 //                // padding:  EdgeInsets.only(left:40.0),
//                 //                 itemBuilder: (BuildContext context, int index) {
//                 //                   return    Container(
//                 //
//                 //
//                 //                     // height: categoriesList[index+1].contains(snapshot.data!.docs[index].data()["categories"])?
//                 //                     //  0:snapshot.data!.docs[index].data()["money"]/10,
//                 //                     height: 10,
//                 //                     width: 2,
//                 //
//                 //                     decoration: BoxDecoration(
//                 //                         color: CustomColors.colorYellow,
//                 //                         borderRadius:  BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0))
//                 //                     ),
//                 //                   );
//                 //                 }),
//                 //           ),
//                 //           Container(
//                 //             height: 300,
//                 //             child: ListView.builder(
//                 //                 scrollDirection: Axis.horizontal,
//                 //                 itemCount:    categoriesList.length,
//                 //                 // padding:  EdgeInsets.only(left:40.0),
//                 //                 itemBuilder: (BuildContext context, int index) {
//                 //                   return  Container(
//                 //                     height: 90,
//                 //                     child:   RotatedBox(
//                 //                       quarterTurns: 3,
//                 //                       child:     Text(categoriesList[index].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),),
//                 //
//                 //                     ),
//                 //                   );
//                 //                 }),
//                 //           ),
//                 //           Row(
//                 //
//                 //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //             children: [
//                 //               Container(
//                 //                   width: 395.5,
//                 //                   decoration:BoxDecoration(
//                 //                     border: Border(
//                 //                       bottom: BorderSide( //                   <--- left side
//                 //                         color: CustomColors.colorGrey,
//                 //                         width: 1.0,
//                 //                       ),
//                 //
//                 //                     ),
//                 //                   ),
//                 //                   child: Text("آخر العمليات",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorWhite,),)),
//                 //               // TextButton(onPressed: null, child:   Text(" مشاهدة الكل",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorYellow,)
//                 //               //   ,),
//                 //               // )
//                 //             ],
//                 //           ),
//                 //           Container(
//                 //             height: 150,
//                 //             child: ListView.builder(
//                 //                 itemCount: snapshot.data!.docs.length,
//                 //                 padding:  EdgeInsets.all(0.0),
//                 //                 itemBuilder: (BuildContext context, int index) {
//                 //
//                 //                   return  Container(
//                 //
//                 //                       margin:const EdgeInsets.only(top: 10,left: 10),
//                 //                       color:CustomColors.colorLightGrey ,
//                 //
//                 //                       child: ListTile(
//                 //
//                 //                           minLeadingWidth: 0,
//                 //
//                 //                           title: Row(
//                 //
//                 //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //                             children: [
//                 //                               Text(snapshot.data!.docs[index].data()["purpose"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),),
//                 //                               Text(DateFormat('MM/dd/yyyy').format(snapshot.data!.docs[index].data()["date"].toDate()),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorLowLightGrey),),
//                 //                             ],
//                 //                           )
//                 //                           //   ,leading: Icon(Icons.monetization_on_outlined,color: CustomColors.colorYellow,),
//                 //                           ,leading:SvgPicture.asset(
//                 //                         tileIcon(snapshot.data!.docs[index].data()["categories"] ?? others),
//                 //                         height: snapshot.data!.docs[index].data()["categories"].toString() != "مصروفات أخرى" ? 20.0: 8.0,
//                 //                       ),
//                 //
//                 //                           trailing: snapshot.data!.docs[index].data()["outcome"] == true ? Icon(Icons.arrow_downward_sharp,color: Colors.red,):Icon(Icons.arrow_upward,color: Colors.green,)));
//                 //                 }),
//                 //           )
//                 //         ],
//                 //       );
//                 //     }
//                 //     return const Center(
//                 //       child: CircularProgressIndicator(
//                 //         valueColor: AlwaysStoppedAnimation<Color>(
//                 //           CustomColors.colorWhite,
//                 //         ),
//                 //       ),
//                 //     );
//                 //
//                 //   },
//                 //
//                 // ),
//
//                 // BarChart(),
//                 SizedBox(height: 15),
//
//
//
//
//
//
//               ],
//             ),
//           );;
//         }
//         return const Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(
//               CustomColors.colorWhite,
//             ),
//           ),
//         );
//
//       },
//
//     );

  }
}
