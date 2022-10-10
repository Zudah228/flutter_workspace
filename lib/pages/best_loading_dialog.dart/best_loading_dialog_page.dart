import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/best_loading_dialog.dart/widgets/loading_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BestLoadingDialog extends ConsumerWidget {
  const BestLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('表示'),
          onPressed: () async {
            ref.read(showLoadingDialog)();
            await Future.delayed(const Duration(seconds: 3));
            ref.read(hideLoadingDialog)();
          },
        ),
      ),
    );
  }
}
