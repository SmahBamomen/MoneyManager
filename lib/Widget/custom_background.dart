import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width:double.infinity ,
        height:double.infinity ,
          child: child,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CustomColors.colorGradient,
              tileMode: TileMode.mirror,
            ),
          )
      ),
    );
  }
}
