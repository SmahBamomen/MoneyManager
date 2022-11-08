import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';

class AlertSccess extends StatefulWidget {
  const AlertSccess({Key? key}) : super(key: key);

  @override
  State<AlertSccess> createState() => _AlertSccessState();
}

class _AlertSccessState extends State<AlertSccess> {
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
                  child: Center(
                    child: Column(
                      children: [
                        Text("                                 "),
                        Text("                                 "),

                        Icon(Icons.check_circle_outline_sharp, color: CustomColors.colorYellow,size: 100, ),
                        Text("تمت الإضافة بنجاح",style: TextStyle(fontSize: 30,color: CustomColors.colorYellow),),
                      ]
                      ,
                    ),


                  ),
                ),
              );
            })
    );
  }
}