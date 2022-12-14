import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/model/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AlertGoals extends StatefulWidget {
  const AlertGoals({Key? key}) : super(key: key);

  @override
  State<AlertGoals> createState() => _AlertGoalsState();
}

class _AlertGoalsState extends State<AlertGoals> {
  TextEditingController moneyController = new TextEditingController();
  TextEditingController percentController = new TextEditingController();
  TextEditingController purposeController = new TextEditingController();
  String monthCount = "";
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: StatefulBuilder(builder: (BuildContext context, setState) {
          return AlertDialog(
            backgroundColor: CustomColors.colorAlertGrey.withOpacity(0.5),
            scrollable: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: CustomColors.colorWhite)),
            content: Container(
              width: 396,
              height: 210,
              child: Column(
                children: [
                  Text(
                    "ستصل إلى هدفك في غضون ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.colorWhite),
                  ),
                  SizedBox(height: 10),
                  Text(
                    monthCount.isEmpty ? '٠ أشهر' : monthCount,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.colorYellow),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 363,
                    height: 41,
                    child: TextField(
                        controller: moneyController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.colorWhite,
                        ),
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor:
                                CustomColors.colorTextGrey.withOpacity(0.55),
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            // suffixIcon: Icon(Icons.attach_money_sharp),
                            // suffixIconColor: CustomColors.colorHintGrey,
                            hintText: "٠٠،٠٠",
                            hintStyle: TextStyle(
                                color: CustomColors.colorHintGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ))),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 363,
                    height: 41,
                    child: TextField(
                        controller: purposeController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.colorWhite,
                        ),
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor:
                                CustomColors.colorTextGrey.withOpacity(0.55),
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            suffixIcon: Icon(Icons.check),
                            suffixIconColor:
                                CustomColors.colorWhite.withOpacity(0.2),
                            hintText: "هدفك...",
                            hintStyle: TextStyle(
                                color: CustomColors.colorHintGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ))),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 363,
                    height: 41,
                    child: TextField(
                        onChanged: (value) {
                          if (value.isNotEmpty && int.parse(value) != 0) {
                            goalCalculator(
                                8000,
                                double.parse(moneyController.text),
                                double.parse(percentController.text));
                          }
                        },
                        controller: percentController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: CustomColors.colorWhite,
                        ),
                        decoration: InputDecoration(
                            isDense: true,
                            fillColor:
                                CustomColors.colorTextGrey.withOpacity(0.55),
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
                            suffixIcon: Icon(Icons.percent),
                            suffixIconColor:
                                CustomColors.colorWhite.withOpacity(0.2),
                            hintText: "النسبة الشهرية",
                            hintStyle: const TextStyle(
                                color: CustomColors.colorHintGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.0,
                                  color: CustomColors.colorHintGrey),
                              borderRadius: BorderRadius.circular(4),
                            ))),
                  ),
                  const SizedBox(height: 15),

    ],
              ),
            ),
            actionsPadding: EdgeInsets.all(0.0),
            actions: [
              Divider(

                thickness: 1,
                color: CustomColors.colorHintGrey,
              ),
           Center(
             child: TextButton( onPressed: () {

               FirebaseFirestore.instance
                   .collection('users')
                   .doc(auth.currentUser?.uid).collection('goals')
                   .add(
                   {'goalsName':purposeController.text ,
                     'goalsBalance': double.parse(moneyController.text),
                     'duration':monthCount,
                     'rest':double.parse(moneyController.text),
                     'durationRest':monthCount,
                   'percent':'0.0'});
Navigator.pop(context);

          }, child: Text(
  "أضف هدف",
  style: TextStyle(color: CustomColors.colorYellow),
)),
           ),

            ],
          );
        }));
    ;
  }

  void goalCalculator(double salary, double amount, double present) {
    double calculate = salary - present;
    double timeToGoal = (amount / present) / 12;
    // print("the goal is :"+ typeAcc +" and you will save every month : "+ amount.toString());
    if (timeToGoal.remainder(12) != 0.0) {
      double remainder = timeToGoal.remainder(12);
      print(" in " +
          timeToGoal.toStringAsFixed(0) +
          " year and " +
          remainder.toStringAsFixed(0) +
          " months");
      setState(() {
        monthCount = timeToGoal.toStringAsFixed(0) +
            " سنة و " +
            remainder.toStringAsFixed(0) +
            " أشهر ";
      });
    } else {
      //print("you reach to goal "+ accumulate.toString() +" in "+ timeToGoal.toStringAsFixed(0) +" year ");

      setState(() {
        monthCount = timeToGoal.toStringAsFixed(0) + " سنة ";
      });
      print(" in " + timeToGoal.toStringAsFixed(0) + " year and ");
    }
  }
}
