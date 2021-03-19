import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: Center(
        child: Column(
          // NOTE: `mainAxisAlignment:` に縦方向にどのように並ぶかを指定する
          mainAxisAlignment: MainAxisAlignment.center,
          // NOTE: `children:` に縦に並べたい Widget を複数指定する
          children: [
            // NOTE: 上から順に並べられる、まず `Text` が表示されて
            Text('テキスト'),
            // NOTE: その下に `TextButton` が表示される
            TextButton(
              onPressed: () {}, 
              child: Text('Button')
            ),
          ],
        ),
      ),
    );
  }
}