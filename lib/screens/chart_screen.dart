import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartScreen extends StatelessWidget {
  final double currentAssets;
  final double fixedAssets;
  final double currentLiabilities;
  final double longTermLiabilities;
  final double netWorth;

  const ChartScreen({
    super.key,
    required this.currentAssets,
    required this.fixedAssets,
    required this.currentLiabilities,
    required this.longTermLiabilities,
    required this.netWorth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('グラフ画面'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800, // 固定の高さを指定
          padding: const EdgeInsets.all(16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _createSampleData(),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text(
                            '資産',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          );
                        case 1:
                          return const Text(
                            '負債・純資産',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          );
                        default:
                          return const Text(
                            '',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          );
                      }
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(),
                touchCallback: (FlTouchEvent event, barTouchResponse) {},
                handleBuiltInTouches: true,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// サンプルデータを作成する
  ///
  /// 戻り値: List<BarChartGroupData> を返す
  List<BarChartGroupData> _createSampleData() {
    double totalAssets = currentAssets + fixedAssets;
    double totalLiabilitiesAndNetWorth =
        currentLiabilities + longTermLiabilities + netWorth;

    if (totalAssets < 1) totalAssets = 1;
    if (totalLiabilitiesAndNetWorth < 1) totalLiabilitiesAndNetWorth = 1;

    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: currentAssets / totalAssets * 100,
            color: Colors.blue,
            width: 100,
            borderRadius: BorderRadius.zero,
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: (currentAssets + fixedAssets) / totalAssets * 100,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: (currentLiabilities + longTermLiabilities + netWorth) /
                totalLiabilitiesAndNetWorth *
                100,
            color: Colors.orange,
            width: 100,
            borderRadius: BorderRadius.zero,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                currentLiabilities / totalLiabilitiesAndNetWorth * 100,
                Colors.red,
              ),
              BarChartRodStackItem(
                currentLiabilities / totalLiabilitiesAndNetWorth * 100,
                (currentLiabilities + longTermLiabilities) /
                    totalLiabilitiesAndNetWorth *
                    100,
                Colors.orange,
              ),
              BarChartRodStackItem(
                (currentLiabilities + longTermLiabilities) /
                    totalLiabilitiesAndNetWorth *
                    100,
                100,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
