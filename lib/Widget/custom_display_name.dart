
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:flutter_svg/svg.dart';
class CustomDisplayName extends StatelessWidget {

  final String userName;
  const CustomDisplayName({Key? key, required this.userName,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/logo.svg",color: CustomColors.colorYellow,width:38 ,height: 20,),
SizedBox(height: 10),

          Text("أهلاً ،"+userName,style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),)
        ],
      ),
    );
  
  }
}
