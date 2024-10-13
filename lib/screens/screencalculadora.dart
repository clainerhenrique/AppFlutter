import 'package:flutter/material.dart';

import '../componets/appdrawer.dart';


class ScreenCalculadora extends StatefulWidget {
  @override
  _ScreenCalculadoraState createState() => _ScreenCalculadoraState();
}

class _ScreenCalculadoraState extends State<ScreenCalculadora> {
  String display = '0';
  double num1 = 0, num2 = 0;
  String operacao = '';
  bool shouldClear = false;

  void onNumberPressed(String text) {
    setState(() {
      if (shouldClear) {
        display = text;
        shouldClear = false;
      } else {
        display = display == '0' ? text : display + text;
      }
    });
  }

  void onOperatorPressed(String op) {
    setState(() {
      num1 = double.parse(display);
      operacao = op;
      shouldClear = true;
    });
  }

  void calcularResultado() {
    setState(() {
      num2 = double.parse(display);
      switch (operacao) {
        case '+':
          display = (num1 + num2).toString();
          break;
        case '-':
          display = (num1 - num2).toString();
          break;
        case '*':
          display = (num1 * num2).toString();
          break;
        case '/':
          display = num2 != 0 ? (num1 / num2).toString() : 'Erro';
          break;
      }
      shouldClear = true;
    });
  }

  void limpar() {
    setState(() {
      display = '0';
      num1 = 0;
      num2 = 0;
      operacao = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.count(
              crossAxisCount: 4,
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildOperatorButton('/'),
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildOperatorButton('*'),
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildOperatorButton('-'),
                buildButton('0'),
                buildButton('C', isOperator: true, onTap: limpar),
                buildOperatorButton('='),
                buildOperatorButton('+'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, {bool isOperator = false, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => onNumberPressed(text),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isOperator ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isOperator ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOperatorButton(String text) {
    return buildButton(text, isOperator: true, onTap: () {
      if (text == '=') {
        calcularResultado();
      } else {
        onOperatorPressed(text);
      }
    });
  }
}
