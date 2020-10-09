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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  List<String> _todoItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      print('Going to the background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('Back in the active mode');
    }
    super.didChangeAppLifecycleState(state);
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
            onLongPress: () => _promtRemoveTodoItem(index),
          ),
          itemCount: _todoItems.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addToDoItem,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  void _addListItem(String item) {
    setState(() => _todoItems.add(item));
  }

  void _removeListItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _addToDoItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Todo Item'),
        ),
        body: TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addListItem(val);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            hintText: 'Type text here',
          ),
        ),
      );
    }));
  }

  void _promtRemoveTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete this item?'),
          actions: [
            RaisedButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text('OK'),
              onPressed: () {
                _removeListItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
