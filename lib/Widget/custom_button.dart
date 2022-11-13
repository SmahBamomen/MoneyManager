import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final text,
      color,
      width,
      borderRadius,
      action,
      borderColor,
      textColor,
      padding,
      elevation;

  const CustomButton(
      {Key? key,
        required this.text,
        this.padding,
        this.color,
        this.elevation,
        this.borderColor,
        this.textColor,
        this.borderRadius,
        this.width,
        required this.action})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  String? text;
  Color? color;
  Color? bordercolor;
  Color? textcolor;
  double? width;
  double? borderRadius;
  EdgeInsets? padding;
  double? elevation;

  @override
  void initState() {
    text = widget.text;
    color = widget.color;
    bordercolor = widget.borderColor;
    textcolor = widget.textColor;
    width = widget.width;
    borderRadius = widget.borderRadius;
    padding = widget.padding;
    elevation = widget.elevation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.maxFinite,
      child: MaterialButton(
        elevation: elevation ?? 0.0,
        padding: padding ?? const EdgeInsets.all(14),
        minWidth: double.infinity,
        color: widget.color ?? Colors.green,
        shape: inputBorder(
            borderRadius: borderRadius ?? null, color: bordercolor ?? null),
        onPressed: widget.action,
        child: Text(
          text!,
          maxLines: 1,
          style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

OutlineInputBorder inputBorder({widthBorder, color, double? borderRadius}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
        width: widthBorder ?? 1.5,
        color: color ?? Color.fromRGBO(156, 172, 185, 1)),

  );
}