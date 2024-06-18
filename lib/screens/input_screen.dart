import 'package:flutter/material.dart';
import 'chart_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _currentAssetsController =
      TextEditingController();
  final TextEditingController _fixedAssetsController = TextEditingController();
  final TextEditingController _currentLiabilitiesController =
      TextEditingController();
  final TextEditingController _longTermLiabilitiesController =
      TextEditingController();
  final TextEditingController _netWorthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('入力画面'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField(_currentAssetsController, '流動資産'),
              const SizedBox(height: 8.0),
              _buildTextField(_fixedAssetsController, '固定資産'),
              const SizedBox(height: 8.0),
              _buildTextField(_currentLiabilitiesController, '流動負債'),
              const SizedBox(height: 8.0),
              _buildTextField(_longTermLiabilitiesController, '固定負債'),
              const SizedBox(height: 8.0),
              _buildTextField(_netWorthController, '純資産'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(
                        currentAssets:
                            double.tryParse(_currentAssetsController.text) ?? 0,
                        fixedAssets:
                            double.tryParse(_fixedAssetsController.text) ?? 0,
                        currentLiabilities: double.tryParse(
                                _currentLiabilitiesController.text) ??
                            0,
                        longTermLiabilities: double.tryParse(
                                _longTermLiabilitiesController.text) ??
                            0,
                        netWorth:
                            double.tryParse(_netWorthController.text) ?? 0,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'グラフ画面へ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
