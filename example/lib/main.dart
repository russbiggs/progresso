import 'dart:async';

import 'package:flutter/material.dart';

import 'package:progresso/progresso.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progresso Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Progresso Demo App'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<double> tick() {
    return Stream<double>.periodic(const Duration(milliseconds: 100), (x) {
      return x / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Basic Progress"),
            SizedBox(height: 10),
            Progresso(progress: 0.5),
            SizedBox(height: 20),
            Text("Points along line"),
            SizedBox(height: 10),
            Progresso(progress: 0.5, points: [0.1, 0.2, 0.4]),
            SizedBox(height: 20),
            Text("non-zero start position"),
            SizedBox(height: 10),
            Progresso(start: 0.3, progress: 0.5),
            SizedBox(height: 20),
            Text("Custom colors"),
            SizedBox(height: 10),
            Progresso(
                progress: 0.5,
                progressColor: Colors.red,
                backgroundColor: Colors.lightBlue),
            SizedBox(height: 20),
            Text("Line widths"),
            SizedBox(height: 10),
            Progresso(
                progress: 0.5,
                progressStrokeWidth: 20,
                backgroundStrokeWidth: 20),
            SizedBox(height: 20),
            Text("point size"),
            SizedBox(height: 10),
            Progresso(
                progress: 0.5,
                pointInnerRadius: 0,
                pointRadius: 10,
                points: [0.1, 0.2, 0.4]),
            SizedBox(height: 20),
            Text("Line caps"),
            SizedBox(height: 10),
            Progresso(
                progress: 0.5,
                progressStrokeCap: StrokeCap.round,
                backgroundStrokeCap: StrokeCap.round),
            SizedBox(height: 20),
            Text("Point color"),
            SizedBox(height: 10),
            Progresso(
                progress: 0.5,
                points: [0.1, 0.2, 0.4],
                pointColor: Colors.red,
                pointInnerColor: Colors.black),
            SizedBox(height: 20),
            Text("stream progress"),
            SizedBox(height: 10),
            StreamBuilder(
                stream: tick(),
                builder: (_, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasData) {
                    return Progresso(progress: snapshot.data);
                  } else {
                    return Progresso();
                  }
                }),
            SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
