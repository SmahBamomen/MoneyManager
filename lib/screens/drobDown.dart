import 'package:flutter/material.dart';
import 'package:money_manager/Widget/custom_colors.dart';

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

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: CustomColors.colorTextGrey.withOpacity(0.55),
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
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: AlignmentDirectional.center,
            value: value,
            child: Column(
              children: [
                Text(value),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
