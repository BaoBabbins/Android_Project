import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';
import 'dart:io';
class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];
@override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      if(i.isOdd) return new Divider();

      final int index = i ~/ 2;

      if (index >= _array.length) _array.addAll(['$index', '${index + 1}', '${index + 2}']);

      return new ListTile(title: new Text(_array[index]));
    });
  }
}