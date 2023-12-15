import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/view.dart';
import 'controller/controller.dart';
import 'model/counter.dart';
import 'model/counter_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // CounterBase(Counter)クラスの状態を管理するためのプロバイダー
        ChangeNotifierProvider<CounterBase>(create: (_) => Counter()),
        // CounterControllerクラスのインスタンスを提供するプロバイダー
        ProxyProvider<CounterBase, CounterController>(
          // ProxyProvider：あるModelで発生した変更を他のModel、今回で言うとCounterControllerに通知する機能
          // => CounterBase(Counter)クラスに依存している
          update: (_, counter, __) => CounterController(counter),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter MVC Counter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(),
      ),
    );
  }
}
