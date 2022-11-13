import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/model/function.dart';
import 'package:money_manager/screens/alert_goals.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:get/get.dart';
import 'package:money_manager/screens/home.dart';
import 'package:money_manager/screens/reports.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widget/custom.dart';
import 'package:flutter_svg/svg.dart';
class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          CustomDisplayName(userName: userName),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "أهدافي",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: CustomColors.colorWhite,
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return new AlertGoals();
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "أضف هدف جديد",
                      style: TextStyle(color: CustomColors.colorYellow, fontWeight: FontWeight.w400,
                        fontSize: 14,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: CustomColors.colorYellow,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.add, color: CustomColors.colorYellow,size: 20,))
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white, width: 0.5),
              ),
            ),
          ),
          SizedBox(height: 10),

          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).collection('goals').snapshots(),
            builder: (context, snapshot) {
       
              if (snapshot.data!.docs.length.isEqual(0)) {
                return Center(
                      child: Column(

                        children: [
SizedBox(height: 150),
                          SvgPicture.asset("assets/icons/empty_goals.svg"),
                          SizedBox(height: 17.0),
                          Text("ليس لديك أي أهداف قادمة",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: CustomColors.colorGrey),),
                        ]
                        ,
                      ),
                    );
              }
              if (snapshot.hasError) {
                return Text('OPS ! ');
              }

               else if (snapshot.hasData || snapshot.data != null)  {

                return  Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      padding:  EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {

                        return     Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Color.fromRGBO(40, 63, 84, 1),
                                color: Color.fromRGBO(77, 98, 116, 1),
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            // color: Color.fromRGBO(77, 98, 116, 1),
                            // width: 430,

                            height: 115,
                            child: Card(
                              color: Color.fromRGBO(77, 98, 116, 1),
                              // shape: StadiumBorder(
                              //   side: BorderSide(color: Colors.black, width: 2),
                              // ),

                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      CustomCard(
                                        text1: "  الهدف",

                                        text2: snapshot.data!.docs[index].data()["goalsName"],
                                      ),
                                      CustomCard(
                                        text1: "قيمة الهدف ",
                                        text2: snapshot.data!.docs[index].data()["goalsBalance"].toString(),
                                      ),
                                      CustomCard(
                                        text1: "مدة الوصول",
                                        text2: snapshot.data!.docs[index].data()["duration"],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 6, left: 6),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(40, 63, 84, 1),
                                          borderRadius: BorderRadius.all(Radius.circular(3))),
                                      // color: Color.fromRGBO(40, 63, 84, 1),
                                      width: 80,
                                      height: 100,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 6),
                                              child: Text("المتبقي",
                                                  style: TextStyle(
                                                    color: CustomColors.colorYellow,
                                                  )),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 25, bottom: 8),
                                              child: Text(snapshot.data!.docs[index].data()["rest"].toString(),
                                                  style: TextStyle(
                                                      color: CustomColors.colorWhite,
                                                      fontSize: 24,fontWeight: FontWeight.w400)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // width: 70,
                                    // height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 9),
                                      child: Center(
                                        child: new CircularPercentIndicator(
                                          radius: 30.0,
                                          // animation: true,
                                          // animationDuration: 1200,
                                          lineWidth: 8.0,
                                          percent: double.parse(snapshot.data!.docs[index].data()["percent"]), //
                                          center: new Text(
                                            textAlign: TextAlign.center,

                                            snapshot.data!.docs[index].data()["durationRest"].toString(),
                                            style: new TextStyle(
                                              // fontWeight: FontWeight.bold,
                                                fontSize: 9,
                                                color: CustomColors.colorWhite),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Color.fromRGBO(121, 133, 143, 1),
                                          progressColor: Color.fromRGBO(223, 193, 132, 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }


              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    CustomColors.colorWhite,
                  ),
                ),
              );

            },

          ),


        ],
      ),
    );
  }
}
