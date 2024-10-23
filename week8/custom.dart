import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Set your desired button color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: 18),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
