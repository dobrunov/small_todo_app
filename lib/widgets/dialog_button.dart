import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  VoidCallback onPressed;

  DialogButton({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(text),
    );
  }
}
