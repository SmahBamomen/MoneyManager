

import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_button.dart';
import 'package:money_manager/Widget/custom_colors.dart';
import 'package:money_manager/Widget/custom_textfield.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/model/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_manager/screens/drop_down.dart.dart';

var list = <String>[
  'اختر نوع العملية',
  'الراتب',
  'دخل إضافي',
  'التزامات أساسية',
  'وقود',
  'اتصالات',
  'سحب نقدي',
  'اطعمه',
  'أجهزة',
  'مصروفات أخرى'
];
class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController moneyController = new TextEditingController();
  String dropdownValue = list.first;

  // TextEditingController categoriesController = new TextEditingController();
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
               Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: CustomColors.colorTextGrey.withOpacity(0.55),
                    // borderRadius: BorderRadius.all(),
                    borderRadius: BorderRadius.all(Radius.circular(3.75))),
                width: 363,
                height: 41,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,

                  borderRadius: BorderRadius.all(Radius.circular(3.75)),
                  dropdownColor: CustomColors.colorTextGrey.withOpacity(0.55),

                  //لون القائمه حقت الدروب داون
                  icon: const Icon(
                    Icons.expand_more,
                    color: Colors.white,
                  ),
                  elevation: 16,
                  style: const TextStyle(color: CustomColors.colorWhite),
                  //لون خط الدروب داون
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  underline: SizedBox(),
                  items: list.map<DropdownMenuItem<String>>((String value) {

                    return DropdownMenuItem<String>(

                      alignment: AlignmentDirectional.center,
                      value: value,

                      child: Column(
                        children: [

                          Text(value),
                          Divider(
                            thickness: 0.5,
                           color: CustomColors.colorWhite,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
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
                      if(dropdownValue == list[0]){

                      }
                      else{
                        incomeAndOutcomeFunction(
                            double.parse(moneyController.value.text),
                            dropdownValue,
                            purposeController.text,
                            false);

                        Navigator.pop(context);
                      }

                    });
                  },
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width / 3.25,
                  text: 'إضافة دخل',
                  // color: Colors.white,
                  color: Colors.transparent,
                  textColor: CustomColors.colorYellow,
                  action: () {
                    setState(() {


                      if(dropdownValue == list[0]){

                      }
                      else{
                        incomeAndOutcomeFunction(
                            double.parse(moneyController.value.text),
                            dropdownValue,
                            purposeController.text,
                            true);
                        Navigator.pop(context);
                      }

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

  void incomeAndOutcomeFunction(double money , String categories ,String purpose ,bool income) async{
    double salary = 0;
    double incomeCount =0 ;
    FirebaseFirestore fprofits = FirebaseFirestore.instance;

    final collection = await fprofits.collection('users').doc(auth.currentUser?.uid).get();
    final data = collection.data();
    print(data!['monthlyBalance']);
    salary = data!['monthlyBalance'];
    double bacicsOutcome = data!['bacicsOutcome'];
    if (income == true){
      incomeCount = salary + money;
      addToDB(incomeCount,bacicsOutcome);
      FirebaseFirestore.instance
          .collection('users').doc(auth.currentUser?.uid).collection("manager")
          .add({'money':money , 'categories':categories , 'purpose':purpose ,'income':true,'outcome':false,'date':DateTime.now()});

    }
    else {
      incomeCount = salary - money;
      bacicsOutcome = bacicsOutcome + money;
      addToDB(incomeCount,bacicsOutcome);
      FirebaseFirestore.instance
          .collection('users').doc(auth.currentUser?.uid).collection("manager")
          .add({'money':money , 'categories':categories , 'purpose':purpose ,'income':false,'outcome':true,'date':DateTime.now()});

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