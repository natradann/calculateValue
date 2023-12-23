import 'package:flutter/material.dart';
import 'package:test1/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonName,
    required this.onTapped,
    this.bgColor = buttonColor,
    this.fgColor = white,
    this.sizeText = 20,
    this.weightText,
     this.width = 200,
     this.height = 50,
  }) : super(key: key);

  final String buttonName;
  final Function() onTapped;
  final Color? bgColor;
  final Color? fgColor;
  final double sizeText;
  final FontWeight? weightText;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width!, height!),
        padding: EdgeInsets.all(10),
        foregroundColor: fgColor,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        buttonName,
        style: TextStyle(fontSize: sizeText, fontWeight: weightText),
      ),
    );
  }
}
