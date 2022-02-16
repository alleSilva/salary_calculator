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
  final TextEditingController hVController = TextEditingController();
  final TextEditingController dMController = TextEditingController();
  final TextEditingController hE60Controller = TextEditingController();
  final TextEditingController hE110Controller = TextEditingController();
  final TextEditingController nDepController = TextEditingController();

  String _infoText = "Preencha os campos";

  void _resetFields() {
    hVController.text = "";
    dMController.text = "";
    hE110Controller.text = "";
    hE60Controller.text = "";
    nDepController.text = "";

    _infoText = "Preencha os campos";
  }

  double _salary_base(int days, double hourValue) {
    double s = (220 / 30) * days * hourValue;

    return s;
  }

  double extra_hour(double quantity, double hourValue, int percent) {
    if (percent == 60) {
      return quantity * hourValue * 1.6;
    }
    if (percent == 110) {
      return quantity * hourValue * 2.1;
    } else {
      return 0.0;
    }
  }

  void _calculate() {
    setState(() {
      double hV = double.parse(hVController.text);
      double dM = double.parse(dMController.text);
      double hE110 = double.parse(hE110Controller.text);
      double hE60 = double.parse(hE60Controller.text);
      double nDep = double.parse(nDepController.text);

      double result = hE60 + hE110 + dM + nDep + hV;
      _infoText = "$result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Calculadora de Salário"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CalculatorTextFormField(
                    label: 'Valor da hora Trabalhada',
                    controller: hVController),
                CalculatorTextFormField(
                    label: 'Quantas dias tem o mês', controller: dMController),
                CalculatorTextFormField(
                    label: 'Quantas horas extras 60 %',
                    controller: hE60Controller),
                CalculatorTextFormField(
                  label: 'Quantas horas extras 110 %',
                  controller: hE110Controller,
                ),
                CalculatorTextFormField(
                  label: 'Quantos dependentes você tem',
                  controller: nDepController,
                ),
                CalculatorButton(label: 'Calculator', onPressed: _calculate),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(_infoText)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
