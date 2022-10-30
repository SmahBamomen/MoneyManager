import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';

class AlertGoals extends StatefulWidget {
  const AlertGoals({Key? key}) : super(key: key);

  @override
  State<AlertGoals> createState() => _AlertGoalsState();
}

class _AlertGoalsState extends State<AlertGoals> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(

                backgroundColor: CustomColors.colorAlertGrey.withOpacity(0.5),
                scrollable: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(color: CustomColors.colorWhite)),
                content: Container(
                  width: 396,
                  height: 280,
                  child: Column(
                    children: [
                      Text("You will reach your goal after ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: CustomColors.colorWhite),),
                   SizedBox(height: 10),
                      Text("0 Months",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),),
                      SizedBox(height: 10),
                  Container(
                    width: 363,
                    height: 41,
                    child: TextField(

                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.colorWhite,
                        ),
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor: CustomColors.colorTextGrey.withOpacity(0.55),
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            suffixIcon: Icon(Icons.attach_money_sharp),
                            suffixIconColor: CustomColors.colorHintGrey,
                            hintText: "00,00",
                            hintStyle: TextStyle(
                                color: CustomColors.colorHintGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width:  1.0,
                                  color:  CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular( 4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width:  1.0,
                                  color:  CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular( 4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width:  1.0,
                                  color:  CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular( 4),
                            ))),
                  ),
                      SizedBox(height: 5),
                      Container(
                        width: 363,
                        height: 41,
                        child: TextField(

                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.colorWhite,
                            ),
                            decoration: InputDecoration(
                                isDense: true,
                                fillColor: CustomColors.colorTextGrey.withOpacity(0.55),
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                                suffixIcon: Icon(Icons.check),
                                suffixIconColor: CustomColors.colorHintGrey,
                                hintText: "Your goal ",
                                hintStyle: TextStyle(
                                    color: CustomColors.colorHintGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ))),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 363,
                        height: 41,
                        child: TextField(

                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.colorWhite,
                            ),
                            decoration: InputDecoration(
                                isDense: true,
                                fillColor: CustomColors.colorTextGrey.withOpacity(0.55),
                                filled: true,
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                                suffixIcon: Icon(Icons.percent),
                                suffixIconColor: CustomColors.colorHintGrey,
                                hintText: "Monthly average",
                                hintStyle: TextStyle(
                                  color: CustomColors.colorHintGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width:  1.0,
                                      color:  CustomColors.colorHintGrey),
                                  borderRadius: BorderRadius.circular( 4),
                                ))),
                      ),
                      SizedBox(height: 15),
                      // Divider(
                      //
                      //   thickness: 1,
                      //   color: CustomColors.colorHintGrey,
                      // ),
                      Container(
                        padding: EdgeInsets.only(left: 16,right: 16),
                        width: 396,
                        child: OutlinedButton(

                            style: ButtonStyle(

                                side: MaterialStateProperty.all(BorderSide(
                                    color: CustomColors.colorHintGrey,
                                    width: 1.0,

                                    style: BorderStyle.solid))),onPressed:  (){

                        }, child: Text("Add Goal",style: TextStyle(color: CustomColors.colorYellow),)),
                      ),
// OutlinedButton(onPressed: null, child: Text("Add Goal",style: TextStyle(color: CustomColors.colorYellow,fontWeight: FontWeight.w600,fontSize: 14))),
                  // TextButton(onPressed: null, child: Text("Add Goal",style: TextStyle(color: CustomColors.colorYellow,fontWeight: FontWeight.w600,fontSize: 14))),


                    ],
                  ) ,
                ),
              );}));;
  }
}
