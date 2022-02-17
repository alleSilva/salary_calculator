import 'package:flutter/material.dart';

class CalculatorTextFormField extends StatelessWidget {
  final primaryColor = const Color(0xFF5d8aa8);
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;

  const CalculatorTextFormField(
      {Key? key,
      required this.label,
      this.controller,
      this.obscureText = false,
      this.validator,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChange,
        cursorColor: primaryColor,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            isDense: true,
            labelText: label,
            labelStyle: const TextStyle(color: Colors.blueGrey, fontSize: 18.0),
            errorStyle:
                const TextStyle(color: Colors.redAccent, fontSize: 16.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(color: primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: const BorderSide(color: Colors.blueGrey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(color: primaryColor)),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
