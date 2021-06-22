import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculator App',
    theme: ThemeData(primaryColor: Color(0xffFFA726)),
    debugShowCheckedModeBanner: false,
    home: _Calculator(),
  ));
}

class _Calculator extends StatefulWidget {
  @override
  __CalculatorState createState() => __CalculatorState();
}

class __CalculatorState extends State<_Calculator> {
  var input = '';
  var equal = '=';
  var result = '';
  var clear = 'C';
  output() {
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      input = eval.toString();
    });
  }

  Widget customButton(var texxt) {
    return Center(
      child: OutlinedButton(
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.orange.shade400,
          child: Text(
            texxt,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          // primary: Colors.blueAccent,
          backgroundColor: Colors.orange.shade400,
          padding: EdgeInsets.all(25),
          shape: StadiumBorder(),
        ),
        onPressed: () {
          setState(() {
            input += texxt;
          });
          if (texxt == clear) {
            setState(() {
              input = '';
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Color(0x000),
        centerTitle: true,
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.calculate_sharp), onPressed: () {})
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 250,
              height: 40,
              color: Colors.black,
              child: Center(
                child: Text(
                  input,
                  style: TextStyle(color: Colors.grey, fontSize: 23.4),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton('7'),
                customButton('8'),
                customButton('9'),
                customButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton('4'),
                customButton('5'),
                customButton('6'),
                customButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton('1'),
                customButton('2'),
                customButton('3'),
                customButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton('0'),
                customButton('.'),
                OutlinedButton(
                  onPressed: output,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.orange.shade400,
                    child: Text(
                      equal,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    padding: EdgeInsets.all(25),
                    shape: StadiumBorder(),
                  ),
                ),
                customButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton('('),
                customButton(')'),
                customButton(clear),
                OutlinedButton(
                  onPressed: output,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.orange.shade400,
                    child: Text(
                      'E',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    padding: EdgeInsets.all(25),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
