

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_display_name.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('OPS ! ');
        } else if (snapshot.hasData || snapshot.data != null) {

          return CustomBackground(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),


                CustomDisplayName(userName:snapshot.data!["userName"],route: "home",),
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
                            Text(snapshot.data!["monthlyBalance"].toString()+" SAR",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorGreen,),),
                            Text(snapshot.data!["bacicsOutcome"].toString()+" SAR",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorRed,),),
                            Text(snapshot.data!["savingBalance"].toString()+" SAR",style: TextStyle(fontWeight: FontWeight.w500,fontSize:16 ,color: CustomColors.colorWhite,),),

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
                    Text("Last transactions",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorWhite,),),
                    TextButton(onPressed: null, child:   Text("    View All",style: TextStyle(fontWeight: FontWeight.w500,fontSize:12 ,color: CustomColors.colorYellow,),),
                    )
                  ],
                ),
                Divider(
                  height: 0,
                  color: CustomColors.colorWhite,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).collection("manager").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('OPS ! ');
                    } else if (snapshot.hasData || snapshot.data != null) {

                      return   Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            padding:  EdgeInsets.all(0.0),
                            itemBuilder: (BuildContext context, int index) {
                              return  Container(

                                  margin: EdgeInsets.only(top: 10),
                                  color:CustomColors.colorLightGrey ,
                                  height:40 ,
                                  width: 396,
                                  child: ListTile(

                                      title: Text(snapshot.data!.docs[index].data()["purpose"],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: CustomColors.colorWhite),)
                                      ,leading: Icon(Icons.monetization_on_outlined,color: CustomColors.colorYellow,),
                                      trailing: snapshot.data!.docs[index].data()["outcome"] == true ? Icon(Icons.arrow_downward_sharp,color: Colors.red,):Icon(Icons.arrow_upward,color: Colors.green,)));
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColors.colorWhite,
                        ),
                      ),
                    );

                  },

                )


              ],
            ),
          );;
        }
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.colorWhite,
            ),
          ),
        );

      },

    );

  }
}
