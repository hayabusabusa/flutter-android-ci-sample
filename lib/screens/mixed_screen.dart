import 'package:flutter/material.dart';

class MixedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row and Column'),
      ),
      body: Center(
        // NOTE: `Text` とボタン2つを縦に並べる `Column`
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // NOTE: 一番上に表示される `Text`
            Text(
              'Select and tap button',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            // NOTE: ボタンを横に並べる `Row`
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // NOTE: 左のボタン
                TextButton.icon(
                  onPressed: () {
                    print('tapped left button');
                  }, 
                  icon: Icon(Icons.help_outlined), 
                  label: Text('left button'),
                ),
                // NOTE: ボタンの間のスペース
                SizedBox(width: 8),
                // NOET: 右のボタン
                TextButton.icon(
                  onPressed: () {
                    print('tapped right button');
                  },
                  icon: Icon(Icons.info), 
                  label: Text('right button'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}