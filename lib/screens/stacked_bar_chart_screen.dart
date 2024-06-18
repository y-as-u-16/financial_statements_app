import 'package:financial_statements_app/screens/input_screen.dart';
import 'package:flutter/material.dart';

class StackedBarChartScreen extends StatelessWidget {
  const StackedBarChartScreen({super.key});

  /// スタックドバーチャート画面のウィジェットを構築する
  ///
  /// - [context]: BuildContext オブジェクト
  ///
  /// 戻り値: Scaffold ウィジェットを返す
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('決算書グラフ化'),
      ),
      body: const SingleChildScrollView(
        child: InputScreen(),
      ),
    );
  }
}
