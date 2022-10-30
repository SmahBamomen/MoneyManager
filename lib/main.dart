import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/chart.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrx_charts/mrx_charts.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MoneyManagerMain());
}
class MoneyManagerMain extends StatefulWidget {
  const MoneyManagerMain({Key? key}) : super(key: key);

  @override
  State<MoneyManagerMain> createState() => _MoneyManagerMainState();
}

class _MoneyManagerMainState extends State<MoneyManagerMain> {
  int _selectedIndex = 0;
  TextEditingController salaryController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyManagerMain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:       Scaffold(

        body:  Container(
          height:double.infinity ,
          width: double.infinity,
child: Padding(
  padding: const EdgeInsets.only(left: 12.0,right: 12.0),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
SizedBox(height: 100),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Money Hunter",style: TextStyle(fontWeight: FontWeight.w600,fontSize:20 ,color: CustomColors.colorYellow,),),
            Text("Hello , Abdullah",style: TextStyle(fontWeight: FontWeight.w400,fontSize:14 ,color: CustomColors.colorWhite,),)

          ],
        ),
          IconButton(onPressed: null, icon: Icon(Icons.pin_invoke_outlined))

      ],),
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


),
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: CustomColors.colorGradient,
                tileMode: TileMode.mirror,
              ),)),
          bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded,size: 50),

              label: 'Home',

            ),
          BottomNavigationBarItem(
          icon: Icon(Icons.open_in_new_rounded),
          label: 'Open Dialog',
          ),
          ],
          currentIndex: _selectedIndex,
            backgroundColor: CustomColors.colorLightBlue,
            selectedItemColor: _selectedIndex == 1 ? CustomColors.colorWhite :CustomColors.colorGrey,
            unselectedItemColor: _selectedIndex == 1 ? CustomColors.colorWhite :CustomColors.colorGrey,

      ),),
      );
  }


}
