

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/screens/alert_goals.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:get/get.dart';
import 'package:money_manager/screens/home.dart';
import 'package:money_manager/screens/reports.dart';
class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        CustomDisplayName(userName:userName),
SizedBox(height: 50),
        Text("أهدافي",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: CustomColors.colorWhite,),),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
              itemCount: 2,
              padding:  EdgeInsets.all(0.0),
              itemBuilder: (BuildContext context, int index) {
                return   Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 396,
                  height:61 ,
                  decoration: BoxDecoration(
                    color: CustomColors.colorLightBlue,
                    border: Border.all( width: 0.5 ,color:CustomColors.colorWhite ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                    child:   Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Buy new car",style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),),
                            Text("6 Months",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorWhite,),),

                          ],),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("180,000 ",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: CustomColors.colorYellow,),),

                            Text("85,000 ",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16 ,color: CustomColors.colorGreen,),),

                          ],),
                      ],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(height: 30),
        Center(
          child: Container(
            padding: EdgeInsets.only(left: 16,right: 16),
            width: 360,
            height: 41.0,
            child: OutlinedButton(

                style: ButtonStyle(

    side: MaterialStateProperty.all(BorderSide(
    color: CustomColors.colorYellow,
    width: 1.0,

    style: BorderStyle.solid))),onPressed:  (){

              showDialog(context: context, builder: (BuildContext context) {
                return new AlertGoals();
              });
            }, child: Text("أضف هدف جديد",style: TextStyle(color: CustomColors.colorYellow),)),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
