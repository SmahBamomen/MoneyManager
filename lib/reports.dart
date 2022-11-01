import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'chart.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override

  Widget build(BuildContext context) {
    return CustomBackground(

      child: Column(

          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [


            SizedBox(height: 33),
            CustomDisplayName(userName:"المدير المالي"),
            SizedBox(height: 50),


//


//  Container(
//      child:  DefaultTabController(
//             initialIndex: 1,
//              length: 3,
//
//
//   child: TabBar(
//
//     tabs: [
//       Tab(text: "شهري"),
//       Tab(text: "اسبوعي"),
//       Tab(text: "يومي"),
//     ],
//   ),
//      )
// ),

        //     Container(
        //
        //           width: double.maxFinite,
        //        height: 300,
        // child: TabBarView(
        //
        //   children: [
        //     Text("data"),
        //           Text("data"),
        //           Text("data"),
        //
        //
        //           ],
        // ),
        //             ),
        //     )
       Expanded(
         child:  DefaultTabController(
         // initialIndex: 1,
           length: 3,

           child:new
           Scaffold(
             appBar: AppBar(
              bottom: TabBar(

                unselectedLabelColor: Colors.white,
                labelColor: Colors.white60,
                isScrollable: false,
                tabs: [
                  Tab(text: "شهري"),
                  Tab(text: "اسبوعي"),
                  Tab(text: "يومي"),
                ],

                indicatorColor: Colors.amber,
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
                    const TabBarView(
                      children: <Widget>[
                        BarChart(),
                        BarChart(),
                        BarChart(),

              ],
             ),
                  ],
                 ),)
          ),
      ),
       ),




            buildList(),
            Column(


              children: const [


                ListTile(
                  leading:Icon(Icons.arrow_downward,color: Colors.red,),
                  title: Text('قهوة',  textAlign: TextAlign.right,style: TextStyle(color: Colors.white ,fontSize: 12)),
                  trailing: Icon(Icons.coffee_rounded,color: CustomColors.colorYellow),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_upward_sharp,color: Colors.green,),
                  title: Text('دخل إضافي',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                  trailing: Icon(Icons.monetization_on_outlined ,color: CustomColors.colorYellow),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_downward,color: Colors.red,),
                  title: Text('وقود',textAlign: TextAlign.right,style: TextStyle(color: Colors.white,fontSize: 12)),
                  trailing:Icon(Icons.ad_units,color: CustomColors.colorYellow),





                )
              ],
            ),
    ]

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
