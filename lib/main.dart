import 'package:salary_calculator/widgets/calculator_text_form_field.dart';
import 'package:salary_calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SalaryCalculator(),
  ));
}

class SalaryCalculator extends StatefulWidget {
  const SalaryCalculator({Key? key}) : super(key: key);

  @override
  _SalaryCalculatorState createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Calculadora de Salário"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const CalculatorTextFormField(label: 'Valor da hora Trabalhada'),
          const CalculatorTextFormField(label: 'Quantas dias tem o mês'),
          const CalculatorTextFormField(label: 'Quantas horas extras 60 %'),
          const CalculatorTextFormField(label: 'Quantas horas extras 110 %'),
          const CalculatorTextFormField(label: 'Quantos dependentes você tem'),
          CalculatorButton(label: 'Calculator', onPressed: () => {}),
        ],
      ),
    );
  }
}
