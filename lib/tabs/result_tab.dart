import 'package:flutter/material.dart';
import 'package:salary_calculator/core/salary_info.dart';

class ResultTab extends StatelessWidget {
  final List result;
  const ResultTab({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Descontos: ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Desconto INSS: "),
                      Text("R\$ " + result[4].v.toStringAsFixed(2))
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Desconto IRPF: "),
                      Text("R\$ " + result[5].v.toStringAsFixed(2))
                    ],
                  ),
                ],
              )),
          const Text('Recebidos: ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Quinzena: "),
                    Text("R\$ " + result[6].v.toStringAsFixed(2))
                  ],
                ),
                Row(
                  children: [
                    const Text("Horas extras 60 %: "),
                    Text("R\$ " + result[0].v.toStringAsFixed(2))
                  ],
                ),
                Row(
                  children: [
                    const Text("Horas extras 110 %: "),
                    Text(result[1].v.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text("Recebido no final do mês: "),
                    Text("R\$ " + result[7].v.toStringAsFixed(2))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Total Recebido no fim do mês: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                ),
              ],
            ),
          ),
          Text(result[2].k),
          Text(result[3].k),
          Text(result[4].k),
          Text(result[5].k),
          Text(result[6].k),
          Text(result[7].k),
        ]),
      ),
    );
  }
}
