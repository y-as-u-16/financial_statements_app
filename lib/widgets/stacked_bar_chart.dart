import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StackedBarChart extends StatefulWidget {
  const StackedBarChart({super.key});

  /// StackedBarChart ウィジェットのステートを作成する
  ///
  /// 戻り値: _StackedBarChartState を返す
  @override
  _StackedBarChartState createState() => _StackedBarChartState();
}

class _StackedBarChartState extends State<StackedBarChart> {
  final TextEditingController _currentAssetsController = TextEditingController();
  final TextEditingController _fixedAssetsController = TextEditingController();
  final TextEditingController _currentLiabilitiesController = TextEditingController();
  final TextEditingController _longTermLiabilitiesController = TextEditingController();
  final TextEditingController _netWorthController = TextEditingController();

  /// ウィジェットツリーを構築する
  ///
  /// - [context]: BuildContext オブジェクト
  ///
  /// 戻り値: Column ウィジェットを返す
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTextField(_currentAssetsController, '流動資産'),
              _buildTextField(_fixedAssetsController, '固定資産'),
              _buildTextField(_currentLiabilitiesController, '流動負債'),
              _buildTextField(_longTermLiabilitiesController, '固定負債'),
              _buildTextField(_netWorthController, '純資産'),
              ElevatedButton(
                onPressed: _updateChart,
                child: const Text('グラフ化する'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                            return const Text('資産');
                          case 1:
                            return const Text('負債・純資産');
                          default:
                            return const Text('');
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
      ],
    );
  }

  /// グラフを更新する
  ///
  /// 戻り値: なし
  void _updateChart() {
    setState(() {});
  }

  /// サンプルデータを作成する
  ///
  /// 戻り値: List<BarChartGroupData> を返す
  List<BarChartGroupData> _createSampleData() {
    double currentAssets = double.tryParse(_currentAssetsController.text) ?? 0;
    double fixedAssets = double.tryParse(_fixedAssetsController.text) ?? 0;
    double currentLiabilities = double.tryParse(_currentLiabilitiesController.text) ?? 0;
    double longTermLiabilities = double.tryParse(_longTermLiabilitiesController.text) ?? 0;
    double netWorth = double.tryParse(_netWorthController.text) ?? 0;

    double totalAssets = currentAssets + fixedAssets;
    double totalLiabilitiesAndNetWorth = currentLiabilities + longTermLiabilities + netWorth;

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
            toY: (currentLiabilities + longTermLiabilities + netWorth) / totalLiabilitiesAndNetWorth * 100,
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
                (currentLiabilities + longTermLiabilities) / totalLiabilitiesAndNetWorth * 100,
                Colors.orange,
              ),
              BarChartRodStackItem(
                (currentLiabilities + longTermLiabilities) / totalLiabilitiesAndNetWorth * 100,
                100,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  /// テキストフィールドを構築する
  ///
  /// - [controller]: TextEditingController オブジェクト
  /// - [label]: テキストフィールドのラベル
  ///
  /// 戻り値: TextField ウィジェットを返す
  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
    );
  }
}
