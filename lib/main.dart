import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/navigator/tab_navigator.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '携程旅游',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator()
    );
  }
}