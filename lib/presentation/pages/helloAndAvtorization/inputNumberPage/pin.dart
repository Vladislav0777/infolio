import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

const String MATERIAL_SCREEN = "/material_screen";
const String CUPERTINO_SCREEN = "/cupertino_screen";


class MyApp2 extends StatefulWidget {
  // This widget is the root of your application.
  final bool isMaterial;

  const MyApp2({Key? key, required this.isMaterial}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  late String errorMessage;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMaterial
        ? MaterialApp(
      title: "Flutter Demo",
      home: materialPin(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF9FA0A5),
            ),
          ),
        ),
      ),
    )
        : CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(),
      home: cupertinoPin(),
    );
  }

  Scaffold materialPin() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material Pin Code Text Field Example"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Text(thisText, style: Theme.of(context).textTheme.title),
              ),
              Container(
                height: 100.0,
                child: GestureDetector(
                  onLongPress: () {
                    print("LONG");
                    showDialog<AlertDialog>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                            Text("Paste clipboard stuff into the pinbox?"),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () async {
                                    var copiedText =
                                    await Clipboard.getData("text/plain");
                                    if (copiedText!.text!.isNotEmpty) {
                                      controller.text = copiedText.text!;
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("YES")),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No"))
                            ],
                          );
                        });
                  },
                  child: PinCodeTextField(
                    autofocus: true,
                    controller: controller,
                    hideCharacter: true,
                    highlight: true,
                    highlightColor: Colors.blue,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.green,
                    highlightPinBoxColor: Colors.orange,
                    maxLength: pinLength,
                    hasError: hasError,
                    maskCharacter: "😎",
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onDone: (text) {
                      print("DONE $text");
                      print("DONE CONTROLLER ${controller.text}");
                    },
                    pinBoxWidth: 50,
                    pinBoxHeight: 64,
                    hasUnderline: true,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 22.0),
                    pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                    pinTextAnimatedSwitcherDuration:
                    Duration(milliseconds: 300),
//                    highlightAnimation: true,
                    highlightAnimationBeginColor: Colors.black,
                    highlightAnimationEndColor: Colors.white12,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Visibility(
                child: Text(
                  "Wrong PIN!",
                ),
                visible: hasError,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: <Widget>[
                    if (!kIsWeb)
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Copy 1234 to Clipboard"),
                        onPressed: () {
                          setState(() {
                            Clipboard.setData(ClipboardData(text: "1111"));
                          });
                        },
                      ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("+"),
                      onPressed: () {
                        setState(() {
                          this.pinLength++;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("-"),
                      onPressed: () {
                        setState(() {
                          this.pinLength--;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("SUBMIT"),
                      onPressed: () {
                        setState(() {
                          this.thisText = controller.text;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("SUBMIT Error"),
                      onPressed: () {
                        setState(() {
                          this.hasError = true;
                        });
                      },
                    ),
                    MaterialButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text("CLEAR PIN"),
                      onPressed: () {
                        controller.clear();
                      },
                    ),
                    MaterialButton(
                      color: Colors.lime,
                      textColor: Colors.black,
                      child: Text("SET TO 456"),
                      onPressed: () {
                        controller.text = "456";
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  CupertinoPageScaffold cupertinoPin() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Pin Code Text Field Example"),
      ),
      child: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(thisText),
                  ),
                  PinCodeTextField(
                    autofocus: false,
                    controller: controller,
                    hideCharacter: true,
                    highlight: true,
                    highlightColor: CupertinoColors.activeBlue,
                    defaultBorderColor: CupertinoColors.black,
                    hasTextBorderColor: CupertinoColors.activeGreen,
                    maxLength: pinLength,
                    hasError: hasError,
                    maskCharacter: "🐶",
                    onTextChanged: (text) {
                      setState(() {
                        hasError = false;
                        thisText = text;
                      });
                    },
                    isCupertino: true,
                    onDone: (text) {
                      print("DONE $text");
                    },
                    wrapAlignment: WrapAlignment.end,
                    pinBoxDecoration:
                    ProvidedPinBoxDecoration.roundedPinBoxDecoration,
                    pinTextStyle: TextStyle(fontSize: 30.0),
                    pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:
                    Duration(milliseconds: 300),
                    highlightAnimation: true,
                    highlightAnimationBeginColor: Colors.black,
                    highlightAnimationEndColor: Colors.white12,
                  ),
                  Visibility(
                    child: Text(
                      "Wrong PIN!",
                      style: TextStyle(color: CupertinoColors.destructiveRed),
                    ),
                    visible: hasError,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: <Widget>[
                        CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                          child: Text("+"),
                          onPressed: () {
                            setState(() {
                              this.pinLength++;
                            });
                          },
                        ),
                        CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                          child: Text("-"),
                          onPressed: () {
                            setState(() {
                              this.pinLength--;
                            });
                          },
                        ),
                        CupertinoButton(
//                      color: Colors.blue,
//                      textColor: Colors.white,
                          child: Text("SUBMIT"),
                          onPressed: () {
                            setState(() {
                              this.thisText = controller.text;
                            });
                          },
                        ),
                        CupertinoButton(
//                      color: Colors.red,
//                      textColor: Colors.white,
                          child: Text("SUBMIT Error"),
                          onPressed: () {
                            setState(() {
                              this.hasError = true;
                            });
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}