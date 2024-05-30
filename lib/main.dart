import 'package:flutter/material.dart';
import 'screens/stacked_bar_chart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// アプリのエントリーポイント
  ///
  /// - [context]: BuildContext オブジェクト
  ///
  /// 戻り値: ウィジェットツリーのルートとして MaterialApp を返す
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '決算書グラフ化アプリ',
      home: const StackedBarChartScreen(),
    );
  }
}
