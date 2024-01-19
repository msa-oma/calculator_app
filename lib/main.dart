import 'package:calculator_app/btn_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

// not used
const List keyPad = [
  '/',
  '9',
  '8',
  '7',
  '*',
  '6',
  '5',
  ' 4',
  '-',
  '3',
  '2',
  '1',
  '00',
  '0',
  '.'
];

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = '';

//
  void onButtonPressed(String btnValue) {
    setState(() {
      //
      if (btnValue == 'C') {
        //clear input
        input = '';
        //
      } else if (btnValue == '=') {
        try {
          input = getFinalREsult(input).toString();
        } catch (e) {
          input = 'Error$e';
        }
        //
      } else if (btnValue == '00') {
        input += '00';
        //
      } else if (btnValue == '.') {
        if (input.isEmpty || (input.isNotEmpty && !input.endsWith('.'))) {
          input += btnValue;
        }
        //
      } else if (btnValue == 'DEL') {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } //
      else if (btnValue == '%') {
        try {
          input = (double.parse(input) / 100).toString();
        } catch (e) {
          'ERROR';
        }
      } //
      else {
        input += btnValue;
      }
    });
  }

  //
  double getFinalREsult(String expression) {
    List<String> character = expression.split('');
    List<String> cleanChar = [];
    String currentNumber = '';

    print("character list is $character");
    for (int i = 0; i < character.length; i++) {
      if (character[i] != '') {
        if (isDigit(character[i]) || character[i] == '.') {
          currentNumber += character[i];
        } else {
          if (currentNumber.isNotEmpty) {
            cleanChar.add(currentNumber);
            currentNumber = '';
          }
          cleanChar.add(character[i]);
        }
      }
    }

    if (currentNumber.isNotEmpty) {
      cleanChar.add(currentNumber);
    }
    double result = double.parse(cleanChar[0]);

    for (int i = 1; i < cleanChar.length - 1; i += 2) {
      String operator = cleanChar[i];
      double operand = double.parse(cleanChar[i + 1]);

      if (operator == '+') {
        result += operand;
      } else if (operator == '-') {
        result -= operand;
      } else if (operator == 'x') {
        result *= operand;
      } else if (operator == '/') {
        result /= operand;
      }
    }
    print("result is $result");

    return result;
  }

  bool isDigit(String s) {
    return double.tryParse(s) != null;
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'GO Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 100,
                  width: 500,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$input|',
                    style: const TextStyle(fontSize: 35),
                  )),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnWidget(
                        value: 'C',
                        onPressed: () {
                          onButtonPressed('C');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white),
                    BtnWidget(
                        value: '%',
                        onPressed: () {
                          onButtonPressed('%');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white),
                    BtnWidget(
                        value: 'DEL',
                        onPressed: () {
                          onButtonPressed('DEL');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white),
                    BtnWidget(
                        value: '/',
                        onPressed: () {
                          onButtonPressed('/');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnWidget(
                        value: '7',
                        onPressed: () {
                          onButtonPressed('7');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '8',
                        onPressed: () {
                          onButtonPressed('8');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '9',
                        onPressed: () {
                          onButtonPressed('9');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: 'x',
                        onPressed: () {
                          onButtonPressed('x');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnWidget(
                        value: '4',
                        onPressed: () {
                          onButtonPressed('4');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '5',
                        onPressed: () {
                          onButtonPressed('5');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '6',
                        onPressed: () {
                          onButtonPressed('6');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '-',
                        onPressed: () {
                          onButtonPressed('-');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnWidget(
                        value: '1',
                        onPressed: () {
                          onButtonPressed('1');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '2',
                        onPressed: () {
                          onButtonPressed('2');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '3',
                        onPressed: () {
                          onButtonPressed('3');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '+',
                        onPressed: () {
                          onButtonPressed('+');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BtnWidget(
                        value: '00',
                        onPressed: () {
                          onButtonPressed('00');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '0',
                        onPressed: () {
                          onButtonPressed('0');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '.',
                        onPressed: () {
                          onButtonPressed('.');
                        },
                        bgColor: Colors.grey.shade300,
                        txtColor: Colors.black),
                    BtnWidget(
                        value: '=',
                        onPressed: () {
                          onButtonPressed('=');
                        },
                        bgColor: Colors.black,
                        txtColor: Colors.white)
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
