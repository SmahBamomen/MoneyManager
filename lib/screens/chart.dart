import 'dart:ffi';
import 'dart:math';

import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/drop_down.dart.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class BarChart extends StatefulWidget {

   BarChart({
    Key? key,
  }) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  final FirebaseAuth auth = FirebaseAuth.instance;

 // final List categories = ["اخرى", "وقود","أطعمة","سحب نقدي","التزامات شهرية","أجهزه","قهوه"];
 // final List categories = ["اخرى", "وقود","أطعمة","سحب نقدي","التزامات شهرية","أجهزه","قهوه"];
  final List categoriesKey = [];
   List categoriesValue = [];

  double sum = 0.0;


@override
  void initState() {

  categoriesList.removeAt(0);

  for (int i = 0 ; i < categoriesList.length; i++){
   getAvctUODoss(categoriesList[i]);

  }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).collection("manager").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('OPS ! ');
        } else if (snapshot.hasData || snapshot.data != null) {

          return    Container(
            height: 250.5,
           // width: 495.5,

           padding: const EdgeInsets.all(12.0),
            child:Chart(

              layers: [
                ChartAxisLayer(

                  settings: ChartAxisSettings(
                    x: ChartAxisSettingsAxis(
                      frequency: 1.0,
                      max: 6,
                      min: 0,
                      textStyle: TextStyle(
                        fontFamily: 'LamaSans',
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12.0,
                      ),
                    ),
                    y: ChartAxisSettingsAxis(
                      frequency: 20000,
                      max: 2000,
                      min: 0.0,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 0,
                      ),
                    ),
                  ),
                  labelX: (value) => categoriesList.isNotEmpty ? categoriesList[value.toInt()].toString():categoriesList[value.toInt()].toString(),
                  labelY: (value) => value.toInt().toString(),
                ),

                ChartBarLayer(
                  items: List.generate(

                    categoriesKey.length,
                        (index) => ChartBarDataItem(
                      color: CustomColors.colorYellow,
                      value:  categoriesKey[index.toInt()],
                      x: index.toDouble(),
                    ),
                  ),
                  settings: const ChartBarSettings(

                    thickness: 8.0,
                    radius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ],
            ),
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

    );

  }

 getAvctUODoss(String categories) async {




double checkValue = 0;

     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").doc(auth.currentUser?.uid).collection("manager").where("categories",isEqualTo: categories).get();
     querySnapshot.docs.forEach((documentSnapshot) {
       print(documentSnapshot['money']);
       sum = 0;

       setState(() {
         //print(categories);
        // print(categoriesValue.contains(categories));
         if(categoriesValue.contains(categories)){
           sum +=  documentSnapshot['money'] ?? 0;

           categoriesKey.add(sum);
         }
         else {
           categoriesKey.clear();
           sum +=  documentSnapshot['money'] ?? 0;

           categoriesKey.add(sum);
         }


        // categoriesValue.add(categories);
       });



     });

   if (checkValue == 0){

     setState(() {
       categoriesKey.add(0.0);
       categoriesValue.add(categories);


     });

   }
   final seen = Set<String>();
   List unique = categoriesValue.where((str) => seen.add(str)).toList();
   categoriesValue = unique;
print(unique);
  // print(countries.values.toString());
  }
}