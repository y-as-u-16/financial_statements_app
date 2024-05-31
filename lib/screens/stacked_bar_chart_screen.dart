import 'package:financial_statements_app/widgets/dismiss_keyboard_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/stacked_bar_chart.dart';

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
        child: DismissKeyboardWidget(
          child: StackedBarChart(),
        ),
      ),
    );
  }
}
