import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/pages/rxdart/counter/counter_rxdart_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterRxdartPage extends HookConsumerWidget {
  const CounterRxdartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(counterRxdartPageProvider);
    final pageNotifier = ref.watch(counterRxdartPageProvider.notifier);

    useEffect(() {
      pageNotifier.fetch().then((value) => pageNotifier.listen());
      return;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('カウンター'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pageState.count.toString(),
              style: const TextStyle(
                fontSize: 56,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => pageNotifier.increase(),
                    child: const Icon(Icons.add)),
                const SizedBox(width: 24,),
                ElevatedButton(
                    onPressed: () => pageNotifier.decrease(),
                    child: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
