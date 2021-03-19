import 'package:flutter/material.dart';

class RowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row'),
      ),
      body: Center(
        // NOTE: 画面中央に `TextButton` を表示する
        child: TextButton(
          onPressed: () {
            print('Button tapped');
          }, 
          // NOTE: ここにボタンに表示する Widget として `Row` を指定する
          child: Row(
            // NOTE: `Row` で横に並べたい Widget を複数指定する
            mainAxisSize: MainAxisSize.min,
            children: [
              // NOTE: 左から順に表示されるので `Icon` が表示されて
              Icon(Icons.info),
              // NOTE: 若干アイコンとテキストが詰められているので、余白を設定する
              const SizedBox(width: 8),
              // NOTE: 隣に `Text` が表示される
              Text('Button')
            ],
          ),
        ),
      ),
    );
  }
}