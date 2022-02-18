import 'package:flutter/material.dart';

class ResultTab extends StatelessWidget {
  final String result;
  const ResultTab({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado',
        ),
      ),
      body: Center(
        child: Text(result,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16)),
      ),
    );
  }
}
