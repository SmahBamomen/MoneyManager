import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyInformation extends StatefulWidget {
  const MyInformation({Key? key, }) : super(key: key);

  @override
  State<MyInformation> createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController monthlyBalanceController = new TextEditingController();
  TextEditingController savingBalanceController = new TextEditingController();
  TextEditingController basicOutcomeController = new TextEditingController();
  TextEditingController bandBasicOutcomeController = new TextEditingController();
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


                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        SizedBox(height: 30),
                        SvgPicture.asset("assets/icons/logo.svg",color: CustomColors.colorYellow,width:88 ,height: 48.22,),
SizedBox(height: 20),
                        Text("ادخل بياناتك المالية الأساسية للمرة الأولى",
                          style: TextStyle(
                            color:CustomColors.colorWhite,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),),

                        buildName(),
                        buildMonthly(),
                        buildSaving(),
                        Text(  "                          "),

                        buildBasics(),
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


TextButton(onPressed: () async {
  final FirebaseAuth auth = FirebaseAuth.instance;
double newSalary = double.parse(monthlyBalanceController.text) - double.parse(savingBalanceController.text) -double.parse(basicOutcomeController.text) ;
  FirebaseFirestore.instance
      .collection('users').doc(auth.currentUser?.uid)
      .set({'uid':auth.currentUser?.uid,'userName':userNameController.text,
    'monthlyBalance': newSalary,
    'savingBalance':double.parse(savingBalanceController.text),
    'bacicsOutcome':double.parse(basicOutcomeController.text) });


  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomApp()));
}, child: Text('حفظ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 24,color: CustomColors.colorYellow ),)),

                      ],
                    ),
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


        Text("الاسم " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 7),
        ),
        SizedBox( height: 3),

        Container(

        //  alignment: Alignment.bottomRight,
          height: 17,
          child: TextField(
            controller: userNameController,
            autocorrect: true,
           // textAlign: TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),

              hintText: "تركي ..." ,
              hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),

            ),
            keyboardType: TextInputType.name,
            inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú ]")),],

            style: TextStyle(fontSize:14 ,color: Colors.white ),

          ),


        ),
      ],
    );
  }





  Widget buildMonthly(){
    return Column(


      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الراتب الشهري " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 ,height: 2),
        ),
        SizedBox( height: 3),

        Container(

         // alignment: Alignment.bottomLeft,
          height: 16,
          child: TextField(
            controller: monthlyBalanceController,
            autocorrect: true,
           // textAlign: TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
              hintText: "٠٠،٠٠" ,
              hintStyle:TextStyle(fontSize: 13.0, color:CustomColors.colorGrey),

              //suffixIcon: Icon(Icons.attach_money ,color:  CustomColors.colorYellow,size: 17, ),

            ),

            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'1$|^[1-9]\d*$|^\.\d+$|^0\.\d*$|^[1-9]\d*\.\d*$\d{0,2}'))],
            style: TextStyle(fontSize:14 ,color: Colors.white ),

          ),

        ),
      ],
    );
  }
  Widget buildSaving(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("الإدخار الشهري " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 2),
        ),
        SizedBox( height: 3),

        Container(

          // alignment: Alignment.bottomRight,
          height: 16,
          child: TextField(
            controller: savingBalanceController,
            autocorrect: true,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            decoration: InputDecoration(

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
              hintText: "٠٠،٠٠",
              hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),



            ),


            style: TextStyle(fontSize:14 ,color: Colors.white ),



          ),

        ),
      ],
    );
  }
  Widget buildBasics(){
    return

      Row(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Expanded(
            child:ListTile(


              title:Text('التزامات شهرية', style: TextStyle(color: CustomColors.colorYellow),
              ),
              subtitle:  TextFormField(
                controller: basicOutcomeController,
                autocorrect: true,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  hintText: "٠٠،٠٠",
                  hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey),


                ),
                style: TextStyle(fontSize:14 ,color: Colors.white ),

              ),),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(

            child: ListTile(
              subtitle: TextFormField(
                controller: bandBasicOutcomeController,
                autocorrect: true,

                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  hintText: "ادخل بند الالتزام",
                  hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey , height: 2,),
                  suffixIcon: Icon(Icons.check ,color: CustomColors.colorYellow,size: 20),

                ),
                style: TextStyle(fontSize:14 ,color: Colors.white ),
                keyboardType: TextInputType.name,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú ]")),],


              ),),
          ),


        ],
      );

  }

}


