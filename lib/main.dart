import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  String exp = "";
  double bmargin = 5;
  double bsize = 85;
  double bheight = 60;

  // void _incrementCounter() {
  //   setState(() {
  //     // _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double containerWidth = screenWidth * 0.8; // 80% of the screen width
    final textFieldBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 38, 38),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 146, 144, 143),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(8),
              height: 50,
              width: 370,
              child: Text(
                exp,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(8),
              height: 50,
              width: 370,
              child: TextField(
                readOnly: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                decoration: InputDecoration(
                  hintText: textEditingController.text,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        textEditingController.text = "";
                        exp="";
                      });
                    },
                  ),
                  enabledBorder: textFieldBorder,
                  focusedBorder: textFieldBorder,
                ),
                controller: textEditingController,
                textAlign: TextAlign.end,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton.icon(
                        icon: Icon(Icons.backspace_sharp),
                        label: Text(""),
                        onPressed: () {
                          setState(() {
                            // textEditingController = double.parse(textEditingController.text) * 82.55;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}(";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "(",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                            textEditingController.text = "${textEditingController.text})";
                            });
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          ")",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            exp = textEditingController.text;
                            try {
                              Parser parser= Parser();
                              Expression expression = parser.parse(exp);
                               ContextModel contextModel =ContextModel(); 
                              textEditingController.text = expression.evaluate(EvaluationType.REAL, contextModel).toString() ;
                            } catch (e) {
                              debugPrint("Error : $e");
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "=",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}7";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "7",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}8";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "8",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}9";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "9",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}+";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}4";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "4",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}5";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "5",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}6";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "6",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}-";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}1";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "1",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}2";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "2",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}3";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "3",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}*";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "x",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}0";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "0",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}.";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          ".",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}%";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "%",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(bmargin),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "${textEditingController.text}/";
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          minimumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                          maximumSize:
                              MaterialStatePropertyAll(Size(bsize, bheight)),
                        ),
                        child: const Text(
                          "/",
                          style: TextStyle(fontSize: 33),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   child: const Icon(Icons.add),
      // ), //s trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
