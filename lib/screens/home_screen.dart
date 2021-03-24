import 'package:flutter/material.dart';
import 'package:sample/screens/screens.dart';

import './screen_type.dart';

class HomeScreen extends StatelessWidget {
  final List<ScreenType> screens = [
    ScreenType.Column,
    ScreenType.Row,
    ScreenType.Mixed,
    ScreenType.ListView,
    ScreenType.Future,
    ScreenType.ImageList,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画面一覧'),
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (_, index) => _ListViewItem(type: screens[index]),
      ),
    );
  }
}

class _ListViewItem extends StatelessWidget {
  final ScreenType type;

  _ListViewItem({
    Key? key,
    required this.type,
  }): super(key: key);

  String _title(ScreenType type) {
    switch (type) {
      case ScreenType.Column :
        return 'Column';
      case ScreenType.Row:
        return 'Row';
      case ScreenType.Mixed:
        return 'Mixed';
      case ScreenType.ListView:
        return 'ListView';
      case ScreenType.Future:
        return 'Future';
      case ScreenType.ImageList:
        return '画像リスト';
      default:
        throw UnimplementedError();
    }
  }

  String _subTitle(ScreenType type) {
    switch (type) {
      case ScreenType.Column :
        return 'Column を使ったレイアウト';
      case ScreenType.Row:
        return 'Row を使ったレイアウト';
      case ScreenType.Mixed:
        return 'Column と Row を使ったレイアウト';
      case ScreenType.ListView:
        return 'ListView を使ったリストを表示する';
      case ScreenType.Future:
        return 'Future を使った簡単な例';
      case ScreenType.ImageList:
        return '画像をリストで表示してみる例';
      default:
        throw UnimplementedError();
    }
  }

  Widget _destination(ScreenType type) {
    switch (type) {
      case ScreenType.Column :
        return ColumnScreen();
      case ScreenType.Row:
        return RowScreen();
      case ScreenType.Mixed:
        return MixedScreen();
      case ScreenType.ListView:
        return ListViewScreen();
      case ScreenType.Future:
        return FutureScreen();
      case ScreenType.ImageList:
        return ImageListScreen();
      default:
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_title(this.type)),
      subtitle: Text(
        _subTitle(this.type),
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => _destination(this.type))
        );
      },
    );
  }
}