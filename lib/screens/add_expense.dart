import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_button.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/model/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'drobDown.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController moneyController = new TextEditingController();
  TextEditingController categoriesController = new TextEditingController();
  TextEditingController purposeController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, setState) {
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
                controller: moneyController,

                hinttext: '00,00',
                suffix: Icon(Icons.attach_money),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(10)
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Dropdown(),
              const SizedBox(
                height: 6,
              ),
              CustomTextFeild(
                controller: purposeController,
                hinttext: 'ادخل غرضاً(اختياري)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(children: [
                CustomButton(
                  text: 'انفاق',
                  width: MediaQuery.of(context).size.width / 3.25,
                  // color: Colors.white,
                  color: Colors.transparent,
                  textColor: CustomColors.colorYellow,
                  action: () {
                    setState(() {
                      incomeAndOutcomeFunction(
                          double.parse(moneyController.value.text),
                          categoriesController.text,
                          purposeController.text,
                          true);
                      Navigator.pop(context);
                    });
                  },
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width / 2.75,
                  text: 'إضافة دخل',

                  // color: Colors.white,
                  color: Colors.transparent,
                  textColor: CustomColors.colorYellow,
                  action: () {
                    setState(() {
                      incomeAndOutcomeFunction(
                          double.parse(moneyController.value.text),
                          categoriesController.text,
                          purposeController.text,
                          false);
                      Navigator.pop(context);
                    });
                  },
                ),
              ])
            ],
          ),
        ),
      );
    });
  }

  void incomeAndOutcomeFunction(
      double money, String categories, String purpose, bool income) async {
    double salary = 0;
    double incomeCount = 0;
    FirebaseFirestore fprofits = FirebaseFirestore.instance;

    final collection =
        await fprofits.collection('users').doc(auth.currentUser?.uid).get();
    final data = collection.data();
    print(data!['monthlyBalance']);
    salary = data!['monthlyBalance'];
    double bacicsOutcome = data!['bacicsOutcome'];
    if (income == true) {
      incomeCount = salary + money;
      addToDB(incomeCount, bacicsOutcome);
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .collection("manager")
          .add({
        'money': money,
        'categories': categories,
        'purpose': purpose,
        'income': true,
        'outcome': false
      });
    } else {
      incomeCount = salary - money;
      bacicsOutcome = bacicsOutcome + money;
      addToDB(incomeCount, bacicsOutcome);
      FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .collection("manager")
          .add({
        'money': money,
        'categories': categories,
        'purpose': purpose,
        'income': false,
        'outcome': true
      });
    }
  }

  void addToDB(double monthlyBalance, double bacicsOutcome) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .update(
            {'monthlyBalance': monthlyBalance, 'bacicsOutcome': bacicsOutcome});
  }

  void exposeFunction() {}
}
