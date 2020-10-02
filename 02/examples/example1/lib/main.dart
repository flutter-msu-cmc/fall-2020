import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
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
  List<String> _todoItems = [];

  void _addListItem(String item) {
    setState(() => _todoItems.add(item));
  }

  void _removeListItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(
              _todoItems[index],
            ),
            onLongPress: () => _removeListItem(index),
          ),
          itemCount: _todoItems.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addListItem('Item ${_todoItems.length}'),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
}
