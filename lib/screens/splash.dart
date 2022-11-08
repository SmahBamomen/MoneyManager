import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:get/get.dart';
import 'package:money_manager/screens/my_information.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

  void initState(){
    super.initState();

  }
  // _navigatetohome() async{
  //   await Future.delayed(Duration(milliseconds: 1000 ), (){});
  //   // Get.back();
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSecreen(title:'bbbb',)));
  // }


  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Center(
        child: Container(

          margin: EdgeInsets.only(top: 300),

          child: Column(
            children: [

              SvgPicture.asset("assets/icons/logo.svg",color: CustomColors.colorYellow),

            SizedBox(height: 20),
              Text("رحلة ثراءك تبدأ من هنا" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24 ,  color: CustomColors.colorWhite,
              ),),


              SizedBox(height: 40),



              TextButton.icon(

                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyInformation()));

                  // Get.to(LoginSecreen(title:'bbbb',));
                },
                icon: Icon( // <-- Icon
                  Icons.arrow_forward,
                  color: CustomColors.colorYellow,
                  size: 26.0,


                ),

                label: Text(''),
              ),

            ],


          ),),
      ),
    );
  }
}