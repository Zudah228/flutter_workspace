import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/rxdart/counter/counter_rxdart.dart';
import 'package:flutter_workspace/pages/rxdart/todo/todo_rxdart_page.dart';

class RxdartPage extends StatelessWidget {
  const RxdartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CounterRxdartPage())),
                child: const Text('Counter')),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const TodoRxdartPage())),
                child: const Text('Todo')),
          ],
        ),
      ),
    );
  }
}
