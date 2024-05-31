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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.blue,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[100],
          ),
        ),
      ),
      home: const StackedBarChartScreen(),
    );
  }
}
