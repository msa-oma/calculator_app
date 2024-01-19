import 'package:calculator_app/btn_widget.dart';
import 'package:flutter/material.dart';

class CalculatorKeyPad extends StatelessWidget {
  const CalculatorKeyPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}

class RowCells extends StatelessWidget {
  const RowCells({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BtnWidget(
            value: 'C',
            onPressed: () {},
            bgColor: Colors.black,
            txtColor: Colors.white),
        BtnWidget(
            value: '%',
            onPressed: () {},
            bgColor: Colors.black,
            txtColor: Colors.white),
        BtnWidget(
            value: 'DEL',
            onPressed: () {},
            bgColor: Colors.black,
            txtColor: Colors.white),
        BtnWidget(
            value: 'C',
            onPressed: () {},
            bgColor: Colors.black,
            txtColor: Colors.white)
      ],
    );
  }
}
