import 'counter_base.dart';

/// カウンターの状態を管理するモデルクラス
/// ChangeNotifierを継承しているので、カウンターの状態が変更されたことを通知することができる
class CounterDi extends CounterBase {
  /// カウンタークラスで扱う変数
  @override
  int count = 8;

  @override
  final List<int> counts = [];

  /// カウンタークラスで扱う関数
  @override
  void increment() {
    count++;
    notifyListeners();
  }

  @override
  void append() {
    counts.add(count);
    notifyListeners();
  }

  @override
  void clear() {
    count = 0;
    counts.clear();
    notifyListeners();
  }

  @override
  int calculateTotal() {
    return counts.fold(0, (a, b) => a + b);
  }

  @override
  bool isTotalMultipleOfFive() => calculateTotal() % 8 == 0;
}
