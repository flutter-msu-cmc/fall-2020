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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _myAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 1000),
    // );
    // _myAnimation = Tween<Size>(begin: Size(100, 100), end: Size(120, 120))
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    // _controller.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.repeat();
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
          // Center(
          //   child: AnimatedBuilder(
          //       animation: _myAnimation,
          //       builder: (ctx, ch) => Container(
          //             width: _myAnimation.value.width,
          //             height: _myAnimation.value.height,
          //             decoration: BoxDecoration(
          //               color: Colors.redAccent,
          //             ),
          //           )),
          // ),
          Center(
        child: FadeTransition(
          opacity: _myAnimation,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.forward(),
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
