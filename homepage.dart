import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/Widget/custom_app.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/home.dart';

class LoginSecreen extends StatefulWidget {
  LoginSecreen({Key? key , required this.title }) : super (key: key);

 final String title;
  @override
  State<LoginSecreen> createState() => _LoginSecreenState();
}

class _LoginSecreenState extends State<LoginSecreen> {
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
                      Text("المدير المالي", style: TextStyle(

                        color: CustomColors.colorYellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),),
                      Text("ادخل بياناتك المالية الأساسية للمرة الأولى",
                        style: TextStyle(
                          color:CustomColors.colorWhite,
                          fontSize: 15,
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




                      TextButton.icon(

                        onPressed: () {
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



      crossAxisAlignment: CrossAxisAlignment.end,
      children: [


        Text("الاسم " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 7),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomRight,
          height: 17,
          child: TextField(
            autocorrect: true,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),

              hintText: "..تركي" ,
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


      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("الراتب الشهري " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 ,height: 2),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomLeft,
          height: 16,
          child: TextField(
            autocorrect: true,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
              hintText: "٠٠،٠٠" ,
              hintStyle:TextStyle(fontSize: 13.0, color:CustomColors.colorGrey),

              //suffixIcon: Icon(Icons.attach_money ,color:  CustomColors.colorYellow,size: 17, ),

            ),

            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],

            style: TextStyle(fontSize:14 ,color: Colors.white ),

          ),

        ),
      ],
    );
  }
  Widget buildSaving(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Text("الإدخار الشهري " , style: TextStyle(color: CustomColors.colorYellow , fontSize: 15 , height: 2),
        ),
        SizedBox( height: 3),

        Container(

          alignment: Alignment.bottomRight,
          height: 16,
          child: TextField(
            autocorrect: true,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],


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

            child: ListTile(
              subtitle: TextFormField(
                autocorrect: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  hintText: "ادخل بند الالتزام",
                  hintStyle:TextStyle(fontSize: 13.0, color: CustomColors.colorGrey , height: 2,),
                  icon: Icon(Icons.check ,color: CustomColors.colorYellow,size: 20),

                ),
                style: TextStyle(fontSize:14 ,color: Colors.white ),
                keyboardType: TextInputType.name,
                inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.allow(RegExp("[a-z A-Z á-ú Á-Ú ]")),],


              ),),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child:ListTile(


              title:Align(

             child: Text('التزامات شهرية', textAlign:TextAlign.right , style: TextStyle(color: CustomColors.colorYellow),
    ),
                alignment: Alignment.bottomRight,
              ),
              subtitle:  TextFormField(
                autocorrect: true,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*'))],

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
        ],
      );

  }

}





