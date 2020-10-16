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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _todoItems = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: AnimatedList(
          key: _listKey,
          itemBuilder: (context, index, animation) =>
              _slideItem(context, animation, _todoItems[index]),
          initialItemCount: _todoItems.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addListItem('Item ${_todoItems.length}'),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );

  Widget _slideItem(BuildContext context, Animation animation, String item) {
    return SlideTransition(
      position: animation.drive(Tween(
        begin: Offset(-1, 0),
        end: Offset(0, 0),
      )),
      child: ListTile(
        title: Text(
          item,
        ),
        onLongPress: () => _promtRemoveTodoItem(item),
      ),
    );
  }

  void _addListItem(String item) {
    _listKey.currentState.insertItem(_todoItems.length);
    _todoItems.add(item);
  }

  void _removeListItem(String item) {
    final index = _todoItems.indexOf(item);
    _listKey.currentState.removeItem(
        index, (context, animation) => _slideItem(context, animation, item));
    _todoItems.remove(item);
  }

  void _promtRemoveTodoItem(String item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Remove item ($item)?'),
            actions: [
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  _removeListItem(item);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
