
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_manager/screens/home.dart';
import 'package:money_manager/screens/homepage.dart';
class CustomDisplayName extends StatelessWidget {
  final String route;
  final String userName;
  const CustomDisplayName({Key? key, required this.userName, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Money Hunter",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20 ,color: CustomColors.colorYellow,),),
              Text("Hello "+userName,style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),)
            ],
          ),
        ),

        route == "home" ? IconButton(
          icon:SvgPicture.asset("assets/icons/edit.svg"),
          iconSize: 50,
          onPressed: () {

            Get.to(LoginSecreen(title: 'title'));
          },
        ) : IconButton(
          icon:SvgPicture.asset("assets/icons/house.circle.fill.svg"),
          iconSize: 50,
          onPressed: () {
            Get.to(CustomApp());

          },
        )

      ],);
  
  }
}
