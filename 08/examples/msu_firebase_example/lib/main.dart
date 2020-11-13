import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  /// Метод с начальной инициализацией приложения
  Future<void> init() async {
    await Firebase.initializeApp();
    await PushNotificationsManager().init();
    print('Initialized');
    setState(() => _initialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? MaterialApp(
            title: 'Firebase Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage(),
          )
        : Material(child: Center(child: CircularProgressIndicator()));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final countersCollection = FirebaseFirestore.instance.collection('counters');

  Stream<List<Counter>> get updates => countersCollection.snapshots().map(
      (event) =>
          event.docs.map((e) => Counter.fromJson(e.id, e.data())).toList()
            ..sort((c1, c2) => c1.name.compareTo(c2.name)));

  final _focus = FocusNode();
  final _controller = TextEditingController();
  bool _editing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: SafeArea(
          child: StreamBuilder<List<Counter>>(
              stream: updates,
              builder: (context, snapshot) {
                final counters = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    itemBuilder: (context, index) {
                      final counter = counters[index];
                      return Dismissible(
                        key: ValueKey(counter.id),
                        child: _CounterItem(
                          counter: counter,
                          onUpdate: _updateCounter,
                        ),
                        onDismissed: (direction) => _deleteCounter(counter),
                      );
                    },
                    itemCount: counters.length);
              }),
        ),
        onTap: _stopEdit,
      ),
      bottomSheet: _editing
          ? WillPopScope(
              onWillPop: () async {
                if (_editing) {
                  _stopEdit();
                  return false;
                }
                return true;
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                          style: Theme.of(context).textTheme.headline6,
                          controller: _controller,
                          focusNode: _focus),
                    )),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _addCounter,
                    ),
                  ],
                ),
              ),
            )
          : null,
      floatingActionButton: !_editing
          ? FloatingActionButton(
              onPressed: _startEdit,
              tooltip: 'Create',
              child: Icon(Icons.add),
            )
          : null,
    );
  }

  Future<void> _addCounter() async {
    final name = _controller.value.text;
    await countersCollection.add(Counter.jsonCounter(name, 0));
    _stopEdit();
  }

  Future<void> _updateCounter(Counter counter, int diff) async {
    await countersCollection
        .doc(counter.id)
        .set(Counter.jsonCounter(counter.name, counter.amount + diff));
    setState(() {});
  }

  Future<void> _deleteCounter(Counter counter) async {
    await countersCollection.doc(counter.id).delete();
  }

  void _startEdit() {
    if (_editing) {
      return;
    }
    setState(() => _editing = true);
    _focus.requestFocus();
  }

  void _stopEdit() {
    if (!_editing) {
      return;
    }
    setState(() => _editing = false);
    _controller.clear();
    _focus.unfocus();
  }
}

class _CounterItem extends StatelessWidget {
  final Counter counter;
  final void Function(Counter counter, int diff) onUpdate;

  const _CounterItem({
    Key key,
    this.counter,
    this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(counter.name, style: Theme.of(context).textTheme.headline6),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => onUpdate?.call(counter, -1)),
            Text(counter.amount.toString(),
                style: Theme.of(context).textTheme.headline6),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => onUpdate?.call(counter, 1)),
          ],
        ),
      ),
    );
  }
}

class Counter {
  static Map<String, dynamic> jsonCounter(String name, int amount) =>
      {'name': name, 'amount': amount};

  final String id;
  final String name;
  final int amount;

  const Counter(this.id, this.name, this.amount);

  factory Counter.fromJson(String id, Map<String, dynamic> json) =>
      Counter(id, json['name'], json['amount']);

  Map<String, dynamic> toJson() => {'name': name, 'amount': amount};
}

/// Наша абстракция для работы с push-уведомлениями
class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) {
      return;
    }
    // For iOS only
    FirebaseMessaging.instance.requestPermission();

    String token = await FirebaseMessaging.instance.getToken();
    print("Token: $token");

    _initialized = true;
  }
}
