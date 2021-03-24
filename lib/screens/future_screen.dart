import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 計算に時間がかかる電卓を想定
class SlowCalculator {
  final math.Random random = math.Random();

  /// 乱数を生成
  int generateRandomNumber({int max = 10}) {
    return random.nextInt(max);
  }

  /// 時間はかかるけど足し算をやってくれる
  Future<int> add({required int x, required int y}) async {
    // 考え中...
    await Future.delayed(Duration(milliseconds: 500));
    return x + y;
  }
}

class FutureScreen extends StatefulWidget {
  @override
  _FutureScreenState createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  // NOTE: 電卓を保持
  final SlowCalculator _calculator = SlowCalculator();

  // NOTE: 計算したい2つの値
  int _xValue = 0;
  int _yValue = 0;
  // NOTE: 答え
  int _answer = 0;

  // NOTE: この State が生成された時に呼ばれるメソッド
  @override
  void initState() {
    // NOTE: 値を乱数に変更
    _xValue = _calculator.generateRandomNumber();
    _yValue = _calculator.generateRandomNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future')
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text
            Text(
              '$_answer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Row texts
            Text('$_xValue + $_yValue'),
            // Button
            TextButton(
              onPressed: () async {
                // NOTE: 計算の処理
                final answer = await _calculator.add(x: _xValue, y: _yValue);
                setState(() {
                  this._answer = answer;
                });
              }, 
              child: Text('計算する')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // NOTE: 乱数を更新
            _xValue = _calculator.generateRandomNumber();
            _yValue = _calculator.generateRandomNumber();
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}