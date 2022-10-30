
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';

import 'package:flutter_svg/flutter_svg.dart';
class CustomDisplayName extends StatelessWidget {
  final String userName;
  const CustomDisplayName({Key? key, required this.userName}) : super(key: key);

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

              Text(userName,style: TextStyle(fontWeight: FontWeight.w600,fontSize:20 ,color: CustomColors.colorYellow,),),

              Text("Hello , Abdullah",style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),)

            ],
          ),
        ),

        IconButton(
          icon:SvgPicture.asset("assets/icons/edit.svg"),
          iconSize: 50,
          onPressed: () {


          },
        )

      ],);
  
  }
}
