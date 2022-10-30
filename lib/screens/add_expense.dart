import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_button.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_textfield.dart';
import 'package:flutter/services.dart';
class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, setState) {
      return AlertDialog(

        backgroundColor: CustomColors.colorAlertGrey.withOpacity(0.5),
        scrollable: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: CustomColors.colorWhite)),
        content: Container(
          width: 396,
          height: 243,
          child: Column(
            children: <Widget>[


              CustomTextFeild(
                // widthBorder: 0.0,
                // controller: phoneCtl,

                hinttext: '00,00',
                suffix: Icon(Icons.attach_money),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(10)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFeild(
                hinttext: 'categories',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextFeild(
                hinttext: 'Name a purpose (optional)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(children: [
                CustomButton(
                  text: 'Income',
                  width: MediaQuery.of(context).size.width / 3.25,
                  // color: Colors.white,
                  color: Colors.transparent,
                  textColor: CustomColors.colorYellow,
                  action: () {},
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width / 3.25,
                  text: 'Expose',
                  // color: Colors.white,
                  color: Colors.transparent,
                  textColor: CustomColors.colorYellow,
                  action: () {},
                ),
              ])
            ],
          ),
        ),
      );});
  }
}
