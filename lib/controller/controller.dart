import 'package:flutter/material.dart';

import '../model/counter_base.dart';

/// ユーザーの操作を受け付けるコントローラークラス
/// モデルクラスの状態を操作したり、一部結果をUIに反映させたりする
class CounterController {
  // コンストラクタでCounterモデルクラスを受け取る
  const CounterController(CounterBase counter) : _counter = counter;

  final CounterBase _counter;

  /// 以下、モデルクラスの状態を操作する関数
  void countUp() => _counter.increment();

  void addToList(BuildContext context) {
    _counter.append();
    if (_counter.isTotalMultipleOfFive()) {
      final total = _counter.calculateTotal();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('合計値（$total）は５の倍数です！'),
        ),
      );
    }
  }

  void clear() => _counter.clear();
}
