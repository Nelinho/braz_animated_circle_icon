import 'dart:math';

import 'package:braz_animated_circle_icon/braz_animated_circle_icon.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Color> colors = <Color>[Colors.green, Colors.red, Colors.amber, Colors.blue, Colors.black, Colors.teal];
  final List<IconData> icons = <IconData>[Icons.check, Icons.clear, Icons.alarm, Icons.ac_unit, Icons.assignment_ind, Icons.android];
  
  _getRandomNumber() => Random().nextInt(colors.length);

  @override
  Widget build(BuildContext context) {
    
    int randomIndex = _getRandomNumber();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BrazAnimatedCircleIconWidget(
        key: UniqueKey(), /* IMPORTANT: do NOT use [UniqueKey()] if you don't wanna go crazy, 
                             it's just for presentation purpose here */
        size: 120,
        icon: icons[randomIndex],
        color: colors[randomIndex],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
