import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.text}) : super(key: key);
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text, ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(double.infinity, 50)
      ),
    );
  }
}