import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  static const _defaultColor = Colors.green;

  Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = _defaultColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Upper text',
                  style: Theme.of(context).textTheme.headline3,
                ),
                color: Colors.red,
                padding: EdgeInsets.all(16),
              ),
              Text(
                'Lower text',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            child: Text('One more text'),
            padding: EdgeInsets.all(8),
            color: _backgroundColor,
          ),
          onTap: () {
            final random = Random();
            final red = random.nextInt(255);
            final green = random.nextInt(255);
            final blue = random.nextInt(255);

            final color = Color.fromARGB(255, red, green, blue);
            setState(() {
              _backgroundColor = color;
            });
          },
          onLongPress: () => setState(() => _backgroundColor = _defaultColor),
        ),
      ]),
    );
  }
}
