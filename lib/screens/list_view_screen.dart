import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      // NOTE: ListView.builder` でリストを表示する
      body: ListView.builder(
        // NOTE: リストに表示する要素の数、以下の場合 24 個の要素が表示される
        itemCount: 24,
        // NOTE: ここに表示したい Widget を指定する
        itemBuilder: (index, context) => _ListViewItem(),
      ),
    );
  }
}

// NOTE: `ListView` で繰り返したい要素を Widget として切り出す
// ここでしか使用しないのでアンダーバー `_` をつけてプライベートにしてあげる
class _ListViewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE: `Padding` は余白を設定してあげる Widget
    return Padding(
      // NOTE: 以下のように `EdgeInsets` を使用して余白を指定する
      // この場合、両端に 12px と上下に 16px の余白を指定する
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          // NOTE: 左側のアイコン
          Icon(
            Icons.tag,
            color: Colors.grey,
          ),
          // NOTE: アイコンとテキストの余白
          SizedBox(width: 12,),
          // NOTE: テキスト
          Text('This is ListView item widget'),
        ],
      ),
    );
  }
}