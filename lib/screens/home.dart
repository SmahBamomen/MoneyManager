

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        CustomDisplayName(userName:"Money Hunter"),
        SizedBox(height: 35),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.colorLightBlue,
            borderRadius: BorderRadius.circular(4),
          ),
          height: 81,
          width:397 ,
          child: Padding(
            padding: const EdgeInsets.only(left: 36.0,right: 36.0),
            child:   Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Income",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorYellow,),),
                    Text("Outcome",style: TextStyle(fontWeight: FontWeight.w600,fontSize:14 ,color: CustomColors.colorYellow,),),
                    Text("Saving",style: TextStyle(fontWeight: FontWeight.w600,fontSize:14 ,color: CustomColors.colorYellow,),),

                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("4000",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorWhite,),),
                    Text("500",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorWhite,),),
                    Text("500",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorWhite,),),

                  ],),
              ],
            ),
          ),
        ),
        BarChart(),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Last transactions",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorGrey,),),
            TextButton(onPressed: null, child:   Text("    View All",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorYellow,),),
            )
          ],
        ),
        Divider(
          color: CustomColors.colorWhite,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              padding:  EdgeInsets.all(0.0),
              itemBuilder: (BuildContext context, int index) {
                return  Container(

                    margin: EdgeInsets.only(top: 10),
                    color:CustomColors.colorLightGrey ,
                    height:40 ,
                    width: 396,
                    child: ListTile(

                        title: Text("StarBucks",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),)
                        ,leading: Icon(Icons.coffee_rounded,color: CustomColors.colorYellow,),
                        trailing: Icon(Icons.arrow_downward_sharp,color: Colors.red,)));
              }),
        ),

      ],
      ),
    );
  }
}
