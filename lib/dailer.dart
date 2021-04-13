import 'package:flutter/material.dart';

class Dailpad extends StatelessWidget {

  var number;
  var alpha;

  Dailpad(this.number, this.alpha);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          child:  Column(
                children: <Widget>[
                  Text('$number',style: TextStyle(
                    fontSize: 30,),
                  ),
                  Text('$alpha'),
                ]
              ),
          );
  }
}