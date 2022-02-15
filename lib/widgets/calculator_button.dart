import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? color;
  const CalculatorButton(
      {Key? key, required this.label, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
      child: SizedBox(
        width: 80.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () => {},
          child: Text(
            label,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: color),
        ),
      ),
    );
  }
}
