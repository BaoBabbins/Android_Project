import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:io';
import 'bodyOneScreen.dart';
import 'SecondScreen.dart';
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  bool _loading=false;
  bool _shake=false;
  int _randomNumber=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bus)),
              ],
            ),
            title: Text('Лабораторный проект'),
          ),
          body: TabBarView (
            children: [
              new MaterialApp(
                debugShowCheckedModeBanner: false,
                  home: new Scaffold(body: new Center(child: new MyBody(),))
                ),
                Center(
          // ignore: deprecated_member_use
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThreeScreen()));
              },
              child: Text('Открыть окно выбора кубиков'))),
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              // Center(child: Text("Bike")),
            ],
          ),
        )
    );
  }  
}

