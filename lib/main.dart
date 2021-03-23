import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:io';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
              onPressed: () {
                // accelerometerEvents.listen((AccelerometerEvent event) {
                //   print(event);
                // });
                // userAccelerometerEvents.listen((UserAccelerometerEvent event) {
                //   print(event);
                // });
                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text('Открыть второе окно'))),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно')),
      body: Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThreeScreen()));
              },
              child: Text('Открыть третье окно'))),
    );
  }
}
class ThreeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return Screen();
  }
}
class Screen extends State<ThreeScreen> {
  bool _loading=false;
  bool _shake=false;
  int _randomNumber=0;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Третье окно')),
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
              child: Text('Бросить кубик')),
              Text(
            "${_randomNumber}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.orange,
              fontSize: 48,
              
            ),
            // textDirection: TextDirection.ltr,       // текст слева направо
            // textAlign: TextAlign.center,            // выравнивание по центру
            // style: TextStyle(color: Colors.green,   // зеленый цвет текста
            // fontSize: 26,                       // высота шрифта 26
            // backgroundColor: Colors.black87
          ),
        ]),
      ),
    );
    }
  
  void _update(){
    setState((){
      sleep(Duration(seconds:2));
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      Random random = new Random();
      _randomNumber = random.nextInt(6)+1;
    });
    });
  }

}
void main() {
  runApp(MaterialApp(
    home: MainScreen(),
  ));
  
}
