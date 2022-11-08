import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'chart.dart';
import 'package:flutter_svg/svg.dart';
String userName = "";
class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override

  Widget build(BuildContext context) {
    return CustomBackground(

      child: Expanded(
        child:  DefaultTabController(
          length: 3,
          initialIndex: 2,
          child:
          Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(

                appBar: AppBar(

                 // leading:  CustomDisplayName(userName:userName),
                  actions: [
                    Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/logo.svg",color: CustomColors.colorYellow,width:38 ,height: 20,),
                        SizedBox(height: 10),

                        Text(userName+"، أهلاً ",style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),)
                      ],
                    )
                  ],
                  bottom: TabBar(

                    unselectedLabelColor: Colors.white,
                    labelColor: CustomColors.colorYellow,
                    isScrollable: false,
                    tabs: [
                      Tab(text: "شهري"),
                      Tab(text: "اسبوعي"),
                      Tab(text: "يومي"),





                    ],

                    indicatorColor: CustomColors.colorYellow,
                  ),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: CustomColors.colorGradient
                        )
                    ),
                  ),
                ),
                body:
                Container(
                  decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: CustomColors.colorGradient)),
                  child: Stack(
                    children: [
                      TabBarView(
                        children: <Widget>[
                          Center(child: BarChart()),
                          BarChart(),
                          BarChart(),

                        ],
                      ),
                    ],
                  ),)
            ),
          ),
        ),
      ),

    );

  }


  Widget buildList(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        Text("آخر العمليات",style: TextStyle(fontSize:16 ,color: CustomColors.colorWhite,),),

        Divider(
          color: CustomColors.colorWhite,
        ),
      ],
    );
  }
}