import 'package:flutter/material.dart';
import 'package:salary_calculator/screens/salary_calculator.dart';
import 'package:salary_calculator/tabs/result_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: const <Widget>[
        SalaryCalculator(),
        ResultTab(
          result: [],
        )
      ],
    );
  }
}
