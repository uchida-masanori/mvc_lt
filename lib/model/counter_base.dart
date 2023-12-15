import 'package:flutter/material.dart';

/// CounterをDIしたくて、あとから実装した抽象クラス
abstract class CounterBase extends ChangeNotifier {
  int get count;
  List<int> get counts;

  void increment();
  void append();
  void clear();
  int calculateTotal();
  bool isTotalMultipleOfFive();
}
