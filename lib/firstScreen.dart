import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:io';
import 'bodyOneScreen.dart';
import 'SecondScreen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  bool _loading = false;
  bool _shake = false;
  int _randomNumber = 0;

  List<String> users = ["Tom", "Bob", "Sam", "Mike"];
  List<int> initMod = [3, 6, 4, 3];
  List<int> init = [3, 6, 4, 3];
  final List<Icon> icons = [
    Icon(Icons.face),
    Icon(Icons.tag_faces),
    Icon(Icons.work),
    Icon(Icons.book)
  ];

  _changeName(String text, int i) {
    users[i] = text;
  }

  _changeInit(int text, int i) {
    init[i] = text;
  }

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
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.directions_bus)),
              ],
            ),
            title: Text('Лабораторный проект'),
          ),
          body: TabBarView(
            children: [
              new MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: new Scaffold(
                      body: new Center(
                    child: new MyBody(),
                  ))),

              Center(
                  child: new Column(
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThreeScreen()));
                      },
                      child: Text('Открыть окно выбора кубиков')),

                  Text(users[1], style: TextStyle(fontSize: 22)),
                ],
              )),

              Center(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: users.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: //Text(users[index], style: TextStyle(fontSize: 22)),
                              TextFormField(
                                  initialValue: users[index],
                                  style: TextStyle(fontSize: 22),
                                  onChanged: (text) {
                                    _changeName(text, index);
                                  }),
                          /* subtitle: TextFormField(
                              initialValue: users[index],
                              style: TextStyle(fontSize: 18),
                              onChanged: (text) {
                                _changeName(text, index);
                              }),
                          trailing: TextFormField(
                              initialValue: users[index],
                              style: TextStyle(fontSize: 26),
                              onChanged: (text) {
                                _changeInit(int.parse(text), index);
                              }),*/
                          leading: icons[index],
                        );
                      })),

              Center(child: Text("Transit")),
              // Center(child: Text("Bike")),
            ],
          ),
        ));
  }
}
