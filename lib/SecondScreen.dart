import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:io';
import 'firstScreen.dart';
class ThreeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return Screen();
  }
}
class Screen extends State<ThreeScreen> {
  bool _loading=false;
  bool _shake=false;
  int _randomNumberD6=0;
  int _randomNumberD20=0;
  int _randomNumberD50=0;
  int konechZnach=6;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Oкно кубиков')),
      body: Center(
        child: new Column(children: [          
          // ignore: deprecated_member_use
          RaisedButton(
              onPressed: () {
                setState((){
                  _loading= !_loading;
                  _update();
                });
              },
              child: Text('Бросить кубики')),
              Text(
            "d6 кубик: ${_randomNumberD6}",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.orange,
              fontSize: 54,              
            ),
            // textDirection: TextDirection.ltr,       // текст слева направо
            // textAlign: TextAlign.center,            // выравнивание по центру
            // style: TextStyle(color: Colors.green,   // зеленый цвет текста
            // fontSize: 26,                       // высота шрифта 26
            // backgroundColor: Colors.black87
          ),
          Text(
            "d20 кубик: ${_randomNumberD20}",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.yellow,
              backgroundColor: Colors.green,
              fontSize: 54,              
            ),
          ),
          Text(
            "d50 кубик: ${_randomNumberD50}",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.grey,
              fontSize: 54,              
            ),
          )    
        ]),
      ),
    );
    }
  
  void _update(){
    setState((){
      // sleep(Duration(seconds:2));
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      Random random = new Random();
      _randomNumberD6 = random.nextInt(6)+1;
      _randomNumberD20 = random.nextInt(20)+1;
      _randomNumberD50 = random.nextInt(50)+1;
    });
    });
  }
}