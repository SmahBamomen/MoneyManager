import 'package:flutter/material.dart';

import 'login.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

void initState(){
     super.initState();
     _navigatetohome();
  }
  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 1000 ), (){});

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginSecreen(title:'bbbb',)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

body: Center(
child: Container(
  margin: EdgeInsets.only(top: 300),

  child: Column(
          children: [
            Icon(Icons.monetization_on_outlined ,color: Colors.amber[200],size: 50, ),
            Text("Money Hunter", style: TextStyle(

              color: Colors.amber[200],
              fontSize: 24,
              fontWeight: FontWeight.bold,

              letterSpacing: 1,
            ),),
          Text("Start your wealth journey" , style: TextStyle(fontSize: 15 ,                          color: Colors.white,
          ),),
            Text(  "                          "),
            Text(  "                          "),
            Text(  "                          "),
            Text(  "                          "),
            Text(  "                          "),
            Text(  "                          "),





            TextButton.icon(

    onPressed: () {},
  icon: Icon( // <-- Icon
    Icons.arrow_forward,
    color: Colors.amber[200],
    size: 26.0,


  ),

  label: Text(''),
),

            ],


),),
), );
  }
}
