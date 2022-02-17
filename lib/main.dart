import 'package:salary_calculator/widgets/calculator_text_form_field.dart';
import 'package:salary_calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

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
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController hVController = TextEditingController();
  final TextEditingController dMController = TextEditingController();
  final TextEditingController hE60Controller = TextEditingController();
  final TextEditingController hE110Controller = TextEditingController();
  final TextEditingController nDepController = TextEditingController();
  final TextEditingController atrController = TextEditingController();

  String _infoText = "Preencha os campos";

  void _resetFields() {
    hVController.text = "";
    dMController.text = "";
    hE110Controller.text = "";
    hE60Controller.text = "";
    nDepController.text = "";
    atrController.text = "";

    setState(() {
      _infoText = "Preencha os campos";
    });
  }

  double _salaryBase(int days, double hourValue) {
    double s = (220 / 30) * days * hourValue;

    return s;
  }

  double _quinzena(double hourValue) {
    return 220 * hourValue * 0.4;
  }

  double _extraHour(double quantity, double hourValue, int percent) {
    if (percent == 60) {
      return quantity * hourValue * 1.6;
    }
    if (percent == 110) {
      return quantity * hourValue * 2.1;
    } else {
      return 0.0;
    }
  }

  double _calcInss(double salary) {
    if (salary <= 1212.00) {
      return salary * 0.075;
    } else if (salary >= 1212.01 && salary <= 2427.35) {
      return (salary - 1212.01) * 0.09 + 90.9;
    } else if (salary >= 2427.36 && salary <= 3641.03) {
      return (salary - 2427.36) * 0.12 + 200.28;
    } else if (salary >= 3641.04 && salary <= 7087.22) {
      return (salary - 3641.04) * 0.14 + 345.92;
    } else {
      //salary >= 7087.23
      return 828.39;
    }
  }

  double _calcIr(double salary, double inss, int deps) {
    double base = salary - inss - deps * 189.59;

    if (base <= 1903.98) {
      return 0;
    } else if (base >= 1903.99 && base <= 2826.65) {
      return base * 0.075 - 142.8;
    } else if (base >= 2826.66 && base <= 3751.05) {
      return base * 0.15 - 354.8;
    } else if (base >= 3751.06 && base <= 4664.68) {
      return base * 0.225 - 636.13;
    } else {
      //base >= 4664.69
      return base * 0.275 - 869.36;
    }
  }

  void _calculate() {
    setState(() {
      double hV = double.parse(hVController.text);
      int dM = int.parse(dMController.text);
      double hE110 = double.parse(hE110Controller.text);
      double hE60 = double.parse(hE60Controller.text);
      int nDep = int.parse(nDepController.text);

      double totalExtra60 = _extraHour(hE60, hV, 60);
      double totalExtra110 = _extraHour(hE110, hV, 110);
      double totalExtra = totalExtra110 + totalExtra60;
      double total = _salaryBase(dM, hV) + totalExtra;
      double inss = _calcInss(total);
      double irpf = _calcIr(total, inss, nDep);
      double quinz = _quinzena(hV);
      double liquido = total - inss - irpf - quinz - 26.40;

      _infoText =
          " Quinzena: ${quinz.toStringAsFixed(2)} R\$\n Salário no final do mês: ${liquido.toStringAsFixed(2)} R\$\n inss: ${inss.toStringAsFixed(2)} R\$\n Imposto de Renda: ${irpf.toStringAsFixed(2)} R\$";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Calculadora de Salário"),
        backgroundColor: const Color(0xFF5d8aa8),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CalculatorTextFormField(
                    inputAction: TextInputAction.next,
                    label: 'Valor da hora de trabalho (R\$)',
                    controller: hVController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        double parsedValue = double.parse(value);
                        if (parsedValue <= 0) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorTextFormField(
                    inputAction: TextInputAction.next,
                    label: 'Quantas dias tem o mês',
                    controller: dMController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        int parsedValue = int.parse(value);
                        if (parsedValue <= 0 || parsedValue > 31) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorTextFormField(
                    inputAction: TextInputAction.next,
                    label: 'Quantas horas extras 60 %',
                    controller: hE60Controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        double parsedValue = double.parse(value);
                        if (parsedValue < 0) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorTextFormField(
                    inputAction: TextInputAction.next,
                    label: 'Quantas horas extras 110 %',
                    controller: hE110Controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        double parsedValue = double.parse(value);
                        if (parsedValue < 0) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorTextFormField(
                    inputAction: TextInputAction.next,
                    label: 'Horas de atraso ou faltas',
                    controller: atrController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        double parsedValue = double.parse(value);
                        if (parsedValue < 0) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorTextFormField(
                    inputAction: TextInputAction.done,
                    label: 'Quantos dependentes você tem',
                    controller: nDepController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else {
                        int parsedValue = int.parse(value);
                        if (parsedValue < 0) {
                          return 'Valor inválido';
                        }
                      }
                    },
                  ),
                  CalculatorButton(
                      label: 'Calcular',
                      onPressed: () {
                        final formValid =
                            globalKey.currentState?.validate() ?? false;
                        if (formValid) {
                          _calculate();
                        }
                      },
                      color: const Color(0xFF5d8aa8)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                        child: Text(
                      _infoText,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(
                            0xFF5d8aa8,
                          ),
                          fontWeight: FontWeight.w600),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
