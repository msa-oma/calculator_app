import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  final String value; //number or symbol
  final Function onPressed;
  final Color bgColor;
  final Color txtColor;

  const BtnWidget(
      {super.key,
      required this.value,
      required this.onPressed,
      required this.bgColor,
      required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(5),
          height: 80,
          width: 80,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  color: txtColor, fontSize: 30, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
