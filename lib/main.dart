import 'package:flutter/material.dart';
import 'package:redux_demo/redux/finally/app.dart';
import 'package:redux_demo/redux/redux_demo01.dart';

import 'redux/redux_demo02.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'demo01': (_) => ReduxDemo01(),
        'demo02': (_) => ReduxDemo02(),
        'demo03': (_) => App()
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: MaterialButton(child: Text('ReduxDemo01'), onPressed: () {
                Navigator.pushNamed(context, 'demo01');
              },),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: MaterialButton(child: Text('ReduxDemo02'), onPressed: () {
                Navigator.pushNamed(context, 'demo02');
              },),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: MaterialButton(child: Text('ReduxDemo03'), onPressed: () {
                Navigator.pushNamed(context, 'demo03');
              },),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
