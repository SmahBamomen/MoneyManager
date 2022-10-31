

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_background.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/screens/add_expense.dart';
import 'package:money_manager/screens/chart.dart';
import 'package:money_manager/screens/goals.dart';
import 'package:money_manager/screens/home.dart';
import 'package:money_manager/screens/reports.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomApp extends StatefulWidget {
  const CustomApp({Key? key, }) : super(key: key);

  @override
  State<CustomApp> createState() => _CustomAppState();
}

class _CustomAppState extends State<CustomApp> {
  int _selectedIndex = 0;
  Color changeColor =  CustomColors.colorGrey;

  static const List<Widget> _pages = <Widget>[
    Home(),
    Home(),
    Goals(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomBackground(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
          child:  Center(
            child: _pages.elementAt(_selectedIndex), //New
          )


        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:SvgPicture.asset("assets/icons/report.svg",color:_selectedIndex == 0 ? CustomColors.colorYellow: changeColor ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_rounded,size: 50),
              label: ''

          ),
          BottomNavigationBarItem(
            icon:SvgPicture.asset("assets/icons/goal.svg",color:_selectedIndex == 2 ? CustomColors.colorYellow: changeColor ),
            label: 'Goals',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: CustomColors.colorLightBlue,
        selectedItemColor: CustomColors.colorYellow,
        unselectedItemColor:CustomColors.colorGrey,

      ),);

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

       if(_selectedIndex == 1){
         showDialog(
             context: context,

             builder: (BuildContext context) {
               return  BackdropFilter(
                   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                   child: AddExpense());
      });
       }
    });
  }}