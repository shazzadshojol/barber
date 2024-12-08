import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size screen;
  final String button_text;
  final int? padding;
  const CustomButton({
    super.key,
    required this.screen,
    required this.button_text,this.padding,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding?.toDouble() ?? 13),
      width: screen.width,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Center(
        child: Text(
          button_text,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),),
    );
  }
}