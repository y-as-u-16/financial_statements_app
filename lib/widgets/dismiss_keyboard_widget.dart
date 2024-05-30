import 'package:flutter/material.dart';

class DismissKeyboardWidget extends StatelessWidget {
  final Widget child;

  const DismissKeyboardWidget({
    super.key,
    required this.child,
  });

  /// 画面をタップするとキーボードを閉じるウィジェットを構築する
  ///
  /// - [context]: BuildContext オブジェクト
  ///
  /// 戻り値: GestureDetector ウィジェットを返す
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}
