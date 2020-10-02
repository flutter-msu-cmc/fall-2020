import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ToDoList(title: 'ToDo List'),
    );
  }
}

class Data extends InheritedWidget {
  final String prefix;

  Data({this.prefix, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Data of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Data>();
}

class ToDoList extends StatefulWidget {
  ToDoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> _todoList = [];

  void _addTodoItem(String itemName) {
    if (itemName != null && itemName.length > 0) {
      setState(
        () => _todoList.add(itemName),
      );
    }
  }

  void _removeTodoItem(int index) {
    if (index != null) {
      setState(
        () => _todoList.removeAt(index),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Data(
        prefix: 'qwerty',
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _todoList[index],
                ),
                onLongPress: () => _removeTodoItem(index),
              );
            },
            itemCount: _todoList.length,
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                final dataWidget = Data.of(context);
                final prefix = dataWidget.prefix;
                _addTodoItem('$prefix ${_todoList.length}');
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ),
      );
}
