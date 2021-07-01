import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class CalcController {
  var result = 0.0;
  var a;
  var b;
  var currentOp;
  var operation = "";

  void inputData(int index) {
    final op = options[index];

    if (options[index] == "=") {
      operation = separatesFunctionIntoSmallerFunctions(
        operation, '*', '/');
      operation = separatesFunctionIntoSmallerFunctions(
        operation, '-', '+');
    } else {
      operation += options[index];
    }

    switch (op) {
      case "AC":
        {
          a = null;
          b = null;
          result = 0.0;
          operation = "";
          break;
        }
      case "+":
        {
          currentOp = op;
          break;
        }
      case "-":
        {
          currentOp = op;
          break;
        }
      case "*":
        {
          currentOp = op;
          break;
        }
      case "/":
        {
          currentOp = op;
          break;
        }
      case "=":
        {
          break;
        }
    }
  }

  final options = [
    "AC",
    "%",
    "*",
    "/",
    "7",
    "8",
    "9",
    "-",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "=",
    "0",
    "."
  ];
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = new CalcController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 24.0,
                      bottom: 24.0,
                      left: 24.0,
                    ),
                    child: Text(
                      controller.operation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                crossAxisCount: 4,
                itemCount: 18,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    controller.inputData(index);
                    setState(() {});
                  },
                  child: Container(
                    color: index == 15 ? Color(0xFFF57C00) : Color(0xFF212121),
                    child: Center(
                      child: Text(
                        controller.options[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                staggeredTileBuilder: (int index) {
                  if (index == 15) {
                    return StaggeredTile.count(1, 2);
                  } else if (index == 16) {
                    return StaggeredTile.count(2, 1);
                  } else {
                    return StaggeredTile.count(1, 1);
                  }
                },
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

separatesFunctionIntoSmallerFunctions(text, op1, op2) {
  final onlyNumbers = RegExp('[0-9]');
  bool findOperator = false;
  bool keepLooking = true;

  while (keepLooking) {
    keepLooking = false;
    String operation = '';
    String operator = '';

    for (int i = 0; i < text.length; i++) {
      if ((text[i] == op1 || text[i] == op2) && !findOperator) {
        operation += text[i];
        keepLooking = true;
        findOperator = true;
        if (text[i] == op1) operator = op1;
        if (text[i] == op2) operator = op2;
      } else if (onlyNumbers.hasMatch(text[i])) {
        operation += text[i];

        if (findOperator &&
            ((i + 1 == text.length) || !onlyNumbers.hasMatch(text[i + 1]))) {
          text = text.replaceAll(
              operation, calculateString(operation, operator).toString());
          operation = '';
          findOperator = false;
          break;
        }
      } else {
        operation = '';
      }
    }
  }
  return text;
}

calculateString(text, op) {
  List<String> textArray = [];
  if (op == '*') {
    textArray = text.split(op);
    return double.parse(textArray[0]) * double.parse(textArray[1]);
  } else if (op == '/') {
    textArray = text.split(op);
    return double.parse(textArray[0]) / double.parse(textArray[1]);
  } else if (op == '+') {
    textArray = text.split(op);
    return double.parse(textArray[0]) + double.parse(textArray[1]);
  } else if (op == '-') {
    textArray = text.split(op);
    return double.parse(textArray[0]) - double.parse(textArray[1]);
  }
}
