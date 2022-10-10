import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_workspace/common/extensions/build_context_extension.dart';
import 'package:flutter_workspace/common/providers/navigator_key_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _isLoading = StateProvider((_) => false);

final showLoadingDialog = Provider<VoidCallback>((ref) {
  return () {
    ref.read(_isLoading.notifier).update((_) => true);
    unawaited(showDialog(
        context: ref.read(navigatorKeyProvider).currentContext!,
        builder: (_) => const LoadingDialog()));
  };
});

final hideLoadingDialog = Provider<VoidCallback>((ref) {
  return () {
    ref.read(_isLoading.notifier).update((_) => false);
  };
});

class LoadingDialog extends ConsumerStatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends ConsumerState<LoadingDialog> {
  @override
  Widget build(
    BuildContext context,
  ) {
    ref.listen<bool>(_isLoading, ((_, next) {
      if (mounted) {
        Navigator.pop(context);
      }
    }));
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 32,
          ),
          Text('ローティングなう')
        ],
      ),
      contentPadding: const EdgeInsets.all(32),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('閉じる'))
      ],
    );
  }
}
