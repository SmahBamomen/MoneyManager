import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/Widget/custom_icons.dart';
import 'package:money_manager/constFiles/strings.dart';
import 'package:get/get.dart';
class AllLastTransactions extends StatelessWidget {
  const AllLastTransactions({Key? key, required this.items, required this.userName}) : super(key: key);
final List items;
final String userName;
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration:  BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF274257), Color(0xFF274257)],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
            actions:[
             IconButton(onPressed: (){
               Get.back();
             }, icon:  Icon(Icons.arrow_forward_ios,color: CustomColors.colorWhite,),)
            ],
          leading: Container(),),
        body: CustomBackground(
          child: Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SizedBox(height: 100),
                // CustomDisplayName(userName:userName,),
                SizedBox(height: 35),
                Text("آخر العمليات:",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorWhite,),),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: items.length,
                      padding:  EdgeInsets.all(0.0),
                      itemBuilder: (BuildContext context, int index) {

                        return  Container(

                            margin:const EdgeInsets.only(top: 10,left: 10),
                            color:CustomColors.colorLightGrey ,

                            child: ListTile(

                                minLeadingWidth: 0,

                                title: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(items[index].data()["purpose"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),),
                                    Text(DateFormat('MM/dd/yyyy').format(items[index].data()["date"].toDate()),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorLowLightGrey),),
                                  ],
                                )
                                //   ,leading: Icon(Icons.monetization_on_outlined,color: CustomColors.colorYellow,),
                                ,leading:SvgPicture.asset(
                              tileIcon(items[index].data()["categories"] ?? others),
                              height: items[index].data()["categories"].toString() != "مصروفات أخرى" ? 20.0: 8.0,
                            ),

                                trailing: items[index].data()["outcome"] == true ? Icon(Icons.arrow_downward_sharp,color: Colors.red,):Icon(Icons.arrow_upward,color: Colors.green,)));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
