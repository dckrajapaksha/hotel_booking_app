import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textFieldName;
  final TextEditingController? controller;
  final String? errorText;
  const CustomTextField({
    super.key,
    required this.textFieldName,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          errorText:errorText ,
          label: Text(textFieldName),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
        ),
      ),
    );
  }
}