import 'dart:async';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('表示'),
              onPressed: () async {
                ref.read(showLoadingDialog)();
                await Future.delayed(const Duration(seconds: 3));

                ref.read(hideLoadingDialog)(successMessage: '終わったよ');
              },
            ),
            ElevatedButton(
              child: const Text('表示（エラー）'),
              onPressed: () async {
                ref.read(showLoadingDialog)();
                await Future.delayed(const Duration(seconds: 3));
                ref.read(hideLoadingDialog)(errorMessage: 'エラーだよ');
              },
            ),
            ElevatedButton(
              child: const Text('タイマー表示'),
              onPressed: () async {
                await ref.read(showLoadingDialogWithValue)(3000, 10);

                ref.read(hideLoadingDialog)(successMessage: '終わったよ');
              },
            ),
          ],
        ),
      ),
    );
  }
}
