import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:math_calculator/function/botton.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCal extends StatefulWidget {
  const SimpleCal({super.key});

  @override
  State<SimpleCal> createState() => _SimpleCalState();
}

class _SimpleCalState extends State<SimpleCal> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          indicatorColor: Colors.orange,
          inputDecorationTheme: const InputDecorationTheme()),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 208, 208),
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'C a l c u l a t o r',
                  textStyle: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: const EdgeInsets.all(50.0),
                    surfaceTintColor: Colors.black,
                    elevation: 23.0,
                    color: const Color.fromARGB(255, 255, 159, 129),
                    shadowColor: Colors.black,
                    child: Text(
                      userInput,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 25,
              color: const Color.fromARGB(255, 236, 227, 224),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 45,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Button(
                          color: Colors.black,
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '(',
                          onpress: () {
                            userInput += '(';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: ')',
                          onpress: () {
                            userInput += ')';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '/',
                          onpress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          color: Colors.black,
                          title: '7',
                          onpress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '8',
                          onpress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '9',
                          onpress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: 'x',
                          onpress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          color: Colors.black,
                          title: '4',
                          onpress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '5',
                          onpress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '6',
                          onpress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '+',
                          onpress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          color: Colors.black,
                          title: '1',
                          onpress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '2',
                          onpress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '3',
                          onpress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '-',
                          onpress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Button(
                          color: Colors.black,
                          title: '0',
                          onpress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '.',
                          onpress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: 'DEL',
                          onpress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        Button(
                          color: Colors.black,
                          title: '=',
                          onpress: () {
                            equal();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equal() {
    Parser p = Parser();
    String user = userInput;
    user = userInput.replaceAll('x', '*');

    Expression expression = p.parse(user);
    ContextModel contextModel = ContextModel();

    double relut = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = relut.toString();
  }
}
