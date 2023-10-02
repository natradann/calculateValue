import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonName,
    required this.onTapped,
  }) : super(key: key);

  final String buttonName;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: TextButton.styleFrom(
          fixedSize: Size(200, 50),
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[300],
          side: const BorderSide(color: Colors.black)),
      child: Text(buttonName),
    );
  }
}
