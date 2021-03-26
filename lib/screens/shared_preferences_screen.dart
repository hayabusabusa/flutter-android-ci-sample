import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  @override
  _SharedPreferencesScreenState createState() => _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    // NOTE: カウンターを増やす
    final counter = _counter + 1;

    // NOTE: Shared Preferences にカウンターの値を保存する
    final sharedPreferences = await SharedPreferences.getInstance();
    final _ = await sharedPreferences.setInt('counter', counter);

    setState(() {
      _counter = counter;
    });
  }

  @override
  void initState() { 
    super.initState();

    // NOTE: Shared Preferences に保存した値を読み込む
    // `initState()` 内では `await` が使えないので、`then` で非同期を扱う
    SharedPreferences.getInstance().then((sharedPreferences) {
      setState(() {
        // NOTE: 値が保存されていれば保存された値に更新して、なければ 0 にする
        _counter = sharedPreferences.getInt('counter') ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
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
              style: Theme.of(context).textTheme.headline4,
            ),
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