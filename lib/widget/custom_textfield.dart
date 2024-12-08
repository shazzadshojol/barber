import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hinttext;
  final Widget prefixicon;

  const CustomTextField({super.key, required this.hinttext, required this.prefixicon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffb000000).withOpacity(.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          )
        ],
        border: const Border(
          left: BorderSide(color: Colors.white,width: 1.0),
          right: BorderSide(color: Colors.white,width: 1.0),
          bottom: BorderSide(color: Colors.white,width: 0.9),
          top: BorderSide(color: Colors.white,width: 0.9),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            hintText: hinttext,
          ),
      ),
    );
  }
}