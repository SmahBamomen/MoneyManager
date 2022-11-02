import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/homepage.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
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
              Icon(
                Icons.monetization_on_outlined,
                color: CustomColors.colorYellow,
                size: 50,
              ),
              Text(
                "Money Hunter",
                style: TextStyle(
                  color: CustomColors.colorYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                "Start your wealth journey",
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColors.colorWhite,
                ),
              ),
              Text("                          "),
              Text("                          "),
              Text("                          "),
              Text("                          "),
              Text("                          "),
              Text("                          "),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSecreen(
                                title: 'bbbb',
                              )));

                  // Get.to(LoginSecreen(title:'bbbb',));
                },
                icon: Icon(
                  // <-- Icon
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
    );
  }
}
