import 'package:flutter/material.dart';
import 'dart:math' as math;

// my imports

import 'package:flutter_app/dailer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String displayText = '';
  List<List<BtnItem>> bottons;

  @override
  void initState() {
    super.initState();
    bottons = [
      [
        BtnItem("1", "", true, iconData: Icons.voicemail_outlined),
        BtnItem(
          "2",
          "ABC",
          false,
        ),
        BtnItem(
          "3",
          "DEF",
          false,
        ),
      ],
      [
        BtnItem(
          "4",
          "GHI",
          false,
        ),
        BtnItem(
          "5",
          "JKL",
          false,
        ),
        BtnItem(
          "6",
          "MNO",
          false,
        ),
      ],
      [
        BtnItem(
          "7",
          "PQR",
          false,
        ),
        BtnItem(
          "8",
          "STU",
          false,
        ),
        BtnItem(
          "9",
          "WXYZ",
          false,
        ),
      ],
      [
        BtnItem(
          "*",
          "",
          false,
        ),
        BtnItem(
          "0",
          "",
          false,
        ),
        BtnItem(
          "#",
          "",
          false,
        ),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Container(
                height: 420.0,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Icon for deleting numbers

                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        16.0,
                        8.0,
                        16.0,
                        8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Text(
                            '$displayText',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                          Container(
                              height: 60,
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                  iconSize: 35.0,
                                  onPressed: () {
                                    handleButton("clear");
                                  })),
                        ],
                      ),
                    ),

                    //DialPad Content
                    Container(
                      height: 280,
                      color: Colors.white10,
                      child: Column(
                        children: bottons.map((item) {
                          // First DialPad Row
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: item
                                  .map(
                                    (e) => Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          // String texts = '1'
                                          handleButton("${e.topText}");
                                        },
                                        child: Column(children: <Widget>[
                                          e.isOne
                                              ? Text(
                                                  '${e.topText}',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                  ),
                                                )
                                              : Dailpad('${e.topText}',
                                                  '${e.bottomText}'),
                                          e.isOne
                                              ? Transform.rotate(
                                                  angle: 180 * math.pi / 180,
                                                  child: Icon(e.iconData))
                                              : SizedBox.shrink(),
                                        ]),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: FloatingActionButton(
              onPressed: () async=>_launchURL,
              mini: false,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.phone,
              ),
            ),
          ),
        ),
      ),
    );
  }
void _launchURL() async =>
    await canLaunch(displayText) ? await launch(displayText) : throw 'Could not launch $displayText';
  void handleButton(String number) {
    setState(() {
      if (number == "clear") {
        displayText = displayText.substring(0, displayText.length - 1);
      } else {
        displayText = displayText + '$number';
      }
    });
  }
}

class BtnItem {
  final String topText;
  final String bottomText;
  final bool isOne;
  final iconData;

  BtnItem(this.topText, this.bottomText, this.isOne, {this.iconData});
}
