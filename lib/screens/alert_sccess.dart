import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:flutter_svg/svg.dart';
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
                  height: 200,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SvgPicture.asset("assets/icons/sucess.svg"),
                        SizedBox(height: 20.5),
                        Text("تمت الإضافة بنجاح",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24,color: CustomColors.colorYellow),),
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