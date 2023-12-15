import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';
import '../model/counter_base.dart';

/// ユーザーとのやり取りを行うUIクラス
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// counterは、context.watch<Counter>()を使用して
    /// ChangeNotifierProviderにアクセスしてインスタンスを取得している
    /// CounterクラスはChangeNotifierを継承しているので、状態が変更された時にUIが更新される
    final counter = context.watch<CounterBase>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('カウント'),
            Text(counter.count.toString()),
            const SizedBox(height: 16),
            const Text('リスト'),
            Text(counter.counts.toString()),
            const SizedBox(height: 16),
            const Text('合計値'),
            Text(counter.calculateTotal().toString()),
            const SizedBox(height: 16),
            ElevatedButton(
              // こちらもcontextからCounterControllerクラスのインスタンスを取得している
              // このインスタンスを使用して、ボタンが押された時の処理を実行している
              onPressed: () => context.read<CounterController>().countUp(),
              child: const Text('カウントアップ'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  context.read<CounterController>().addToList(context),
              child: const Text('リストに追加'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<CounterController>().clear(),
              child: const Text('クリア'),
            ),
          ],
        ),
      ),
    );
  }
}
