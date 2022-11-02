import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/Widget/custom_colors.dart';

class CustomTextFeild extends StatefulWidget {
  final hinttext,
      keyboardType,
      inputFormatters,
      controller,
      widthBorder,
      radiusBorder,
      suffix,
      action;

  const CustomTextFeild(
      {Key? key,
      required this.hinttext,
      this.controller,
      this.widthBorder,
      this.radiusBorder,
      this.keyboardType,
      this.action,
      this.suffix,
      this.inputFormatters})
      : super(key: key);

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  String? hinttext;
  Widget? suffix;
  double? widthBorder;
  double? radiusBorder;
  TextInputType? keyboardType;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;

  @override
  void initState() {
    widthBorder = widget.widthBorder;
    radiusBorder = widget.radiusBorder;
    hinttext = widget.hinttext;
    suffix = widget.suffix;
    keyboardType = widget.keyboardType;
    controller = widget.controller;
    inputFormatters = widget.inputFormatters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 41,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters ?? [],
        textAlign: TextAlign.center,
        readOnly: widget.action != null ? true : false,
        onTap: widget.action,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColors.colorTextGrey.withOpacity(0.55),
          hintText: hinttext,
          suffix: widget.suffix,
          isDense: true,
          hintStyle: TextStyle(
            color: CustomColors.colorHintGrey,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          focusedBorder: inputBorder(
              widthBorder: widthBorder ?? null,
              borderRadius: radiusBorder ?? null),
          border: inputBorder(
              widthBorder: widthBorder ?? null,
              borderRadius: radiusBorder ?? null),
          enabledBorder: inputBorder(
              widthBorder: widthBorder ?? null,
              borderRadius: radiusBorder ?? null),
        ),
      ),
    );
  }
}

OutlineInputBorder inputBorder({widthBorder, color, double? borderRadius}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
        width: widthBorder ?? 1.0, color: color ?? CustomColors.colorWhite),
    borderRadius: BorderRadius.circular(borderRadius ?? 4),
  );
}
