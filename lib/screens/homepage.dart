import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginSecreen extends StatefulWidget {
  LoginSecreen({Key? key , required this.title }) : super (key: key);

 final String title;
  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController monthlyBalanceController = new TextEditingController();
  TextEditingController savingBalanceController = new TextEditingController();
  TextEditingController basicOutcomeController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child:  AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(


            children: [
              Container(


                margin: EdgeInsets.only(top: 150),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20,),


                  child: Column(

                    children: [
                      Icon(Icons.monetization_on_outlined ,color:CustomColors.colorYellow,size: 50, ),
                      Text("Money Hunter", style: TextStyle(

                        color: CustomColors.colorYellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),),
                      Text("Enter your Income for the first time",
                        style: TextStyle(
                          color:CustomColors.colorWhite,
                          fontSize: 15,
                        ),),

                      buildName(),
                      buildMonthly(),
                      buildSaving(),
                      buildBasics(),



//

                      /* new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                  hintText: "00,00",
                                  hintStyle:TextStyle(fontSize: 13.0, color: Colors.grey),

                                  suffixIcon: Icon(Icons.attach_money ,color: Colors.amber[200],size: 17, ),


                                )
                            ),
                          ),
                          new Flexible(
                            child: new TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                  hintText: "Name a purpose (optional)",
                                  hintStyle:TextStyle(fontSize: 13.0, color: Colors.grey , height: 2),
                                  suffixIcon: Icon(Icons.check ,color: Colors.amber[200],size: 20, ),

                                )
                            ),
                          ),

                        ],
                      ),*/

                      //



                      TextField(
controller: userNameController,
                        decoration: InputDecoration(

                          hintText: "Name a purpose (optional)",
                          hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey , height: 2),
                          suffixIcon: Icon(Icons.check ,color: CustomColors.colorYellow,size: 20, ),

                        ),

                        style: TextStyle(fontSize:14 ),


                      ),



                      TextButton.icon(
                          label: Container(),
                          style: TextButton.styleFrom(padding: EdgeInsets.all(20),
                          ),
                          icon: Icon(Icons.add_box_outlined, color:CustomColors.colorYellow,
                            size: 26.0,
                          ),

                          onPressed: () {}),

                      Text(  "                          "),
                      Text(  "                          "),
                      Text(  "                          "),




                      TextButton.icon(

                        onPressed: () async{
                          final FirebaseAuth auth = FirebaseAuth.instance;

                          FirebaseFirestore.instance
                              .collection('users').doc(auth.currentUser?.uid)
                              .set({'uid':auth.currentUser?.uid,'userName':userNameController.text,'monthlyBalance': double.parse(monthlyBalanceController.text),'savingBalance':double.parse(savingBalanceController.text),'bacicsOutcome':double.parse(basicOutcomeController.text) });


                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomApp()));

                        },
                        icon: Icon( // <-- Icon
                          Icons.arrow_forward,
                          color: CustomColors.colorYellow,
                          size: 26.0,


                        ),

                        label: Text(''),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }




  Widget buildName(){
    return Column(


      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Text("Name :" , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 7),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomLeft,
          height: 17,
          child: TextField(
            controller: userNameController,
            decoration: InputDecoration(

              hintText: "Type your name ..." ,
              hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),

            ),
            keyboardType: TextInputType.name,

          ),

        ),
      ],
    );
  }





  Widget buildMonthly(){
    return Column(


      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Monthly balance :" , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 ,height: 2),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomLeft,
          height: 16,
          child: TextField(
            controller: monthlyBalanceController,
            decoration: InputDecoration(

              hintText: "00,00" ,
              hintStyle:TextStyle(fontSize: 13.0, color:CustomColors.colorGrey),

              suffixIcon: Icon(Icons.attach_money ,color:  CustomColors.colorYellow,size: 17, ),

            ),

            keyboardType: TextInputType.number,

          ),

        ),
      ],
    );
  }
  Widget buildSaving(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Saving balance :" , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 2),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomLeft,
          height: 16,
          child: TextField(
            controller: savingBalanceController,
            decoration: InputDecoration(

                hintText: "00,00",
              hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),

              suffixIcon: Icon(Icons.attach_money ,color: CustomColors.colorYellow,size: 17, ),


            ),
            keyboardType: TextInputType.number,

          ),

        ),
      ],
    );
  }
  Widget buildBasics(){
    return


      Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Basics outcome :" , style: TextStyle(color: CustomColors.colorYellow, fontSize: 15 , height: 2),
        ),
        SizedBox( height: 3),

        Container(
          alignment: Alignment.bottomLeft,
          height: 16,
          child: TextField(
            controller: basicOutcomeController,
            decoration: InputDecoration(
                hintText: "00,00",
              hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),

              suffixIcon: Icon(Icons.attach_money ,color: CustomColors.colorYellow,size: 17, ),

            ),
            keyboardType: TextInputType.number,


          ),



        ),


      ],



    );
  }
}





