import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/common/repositories/firestore/document_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLifecyclePage extends StatefulHookConsumerWidget {
  const AppLifecyclePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AppLifecyclePageState();
}

class _AppLifecyclePageState extends ConsumerState<AppLifecyclePage>
    with WidgetsBindingObserver {
  AppLifecycleState state = AppLifecycleState.resumed;

  Future<void> _slowFunc() async {
    await Future.forEach(List.generate(10, (index) => index), (i) async {
      await Future.delayed(const Duration(seconds: 1));
      await ref
          .read(firestoreDocumentRepositoryProvider)
          .save('count/$i', data: {'count': i});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState newState) {
    print('AppLifecycleState: ${newState.name}');
    setState(() {
      state = newState;
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addObserver(this);
      print('did useEffect once');
      return () {
        WidgetsBinding.instance.removeObserver(this);
      };
    }, const []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppLifecycleState'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(state.name),
          const SizedBox(height: 24),
          TextButton(onPressed: _slowFunc, child: const Text('遅い処理'))
        ],
      ),
    );
  }
}
