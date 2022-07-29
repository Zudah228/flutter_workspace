import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      body: Center(
        child: Text(state.name),
      ),
    );
  }
}
