import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String res = "";
  var displayResult = "";
  int firstNum;
  int secondNum;
  var another = "";
  String operationPerform;


  Widget customButton(String btnValue){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        child: Text(
            btnValue,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => buttonClicked(btnValue),
      ),
    );
  }

  void buttonClicked(String btnvalue){
    if (btnvalue == "+" || btnvalue == "-" || btnvalue == "*" ||
        btnvalue == "/") {
      print('First Num');
      another = displayResult;
      firstNum = int.parse(displayResult);
      displayResult = "";
      operationPerform = btnvalue;
    }
      else if (btnvalue == "=") {

      secondNum = int.parse(displayResult);
      displayResult = '';

      if (operationPerform == "+") {
        res = (firstNum + secondNum).toString();
      }
      else if (operationPerform == "-") {
        res = (firstNum - secondNum).toString();
      }
      else if (operationPerform == "*") {
        res = (firstNum * secondNum).toString();
      }
      else if (operationPerform == "/") {
        res = (firstNum ~/ secondNum).toString();
      }

    } else if (btnvalue == "Clr") {
      res = "";
      displayResult = '';
      firstNum = 0;
      secondNum = 0;
      operationPerform = '';
    }
    else{

      res =  btnvalue ;

    }
    setState(() {

      displayResult =  res ;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child:Container(
                color: Colors.red[300],
                padding: EdgeInsets.only(bottom: 20,top: 20),
                child: Text(
                  '$displayResult',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
          ),
          Row(
            children: <Widget>[
              customButton("Clr"),
              customButton("0"),
              customButton("="),
              customButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("*"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("7"),
              customButton("8"),
              customButton("9"),
              customButton("+"),
            ],
          ),
        ],
      ),
    );
  }
}
