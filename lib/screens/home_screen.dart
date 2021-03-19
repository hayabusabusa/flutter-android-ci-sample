import 'package:flutter/material.dart';

import './screen_type.dart';

class HomeScreen extends StatelessWidget {
  final List<ScreenType> screens = [
    ScreenType.Column,
    ScreenType.Row,
    ScreenType.Mixed,
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
      default:
        return 'UNKOWN CASE';
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
      default:
        return 'UNKOWN CASE';
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

      },
    );
  }
}