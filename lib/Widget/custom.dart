import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_colors.dart';

class CustomCard extends StatelessWidget {
  final String text1;
  final String text2;
  CustomCard({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 3),
        child: Container(
          width: 196,
          height: 32,
          decoration: BoxDecoration(
              color: Color.fromRGBO(40, 63, 84, 1),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 5,left: 5
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text1, style: TextStyle(color: CustomColors.colorYellow)),

                Text(text2,
                    style: TextStyle(
                        color: CustomColors.colorWhite,
                        package: "pp",
                        fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
