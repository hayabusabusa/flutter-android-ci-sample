import 'package:flutter/material.dart';
import 'package:sample/screens/screens.dart';

import './screen_type.dart';

class HomeScreen extends StatelessWidget {
  final List<ScreenType> screens = [
    ScreenType.Column,
    ScreenType.Row,
    ScreenType.Mixed,
    ScreenType.ListView,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画面一覧'),
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (_, index) => _ListItem(type: screens[index]),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final ScreenType type;

  _ListItem({
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