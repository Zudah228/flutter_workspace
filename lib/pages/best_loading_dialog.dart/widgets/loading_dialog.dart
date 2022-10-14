import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_workspace/app.dart';
import 'package:flutter_workspace/common/providers/navigator_key_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _isLoading = StateProvider((_) => false);

final loadingValue = StateProvider<double?>((_) => null);

final showLoadingDialog = Provider<VoidCallback>((ref) {
  return () {
    ref.read(_isLoading.notifier).update((_) => true);
    unawaited(showDialog(
        context: ref.read(navigatorKeyProvider).currentContext!,
        barrierDismissible: false,
        builder: (_) => const LoadingDialog()));
  };
});

final showLoadingDialogWithValue =
    Provider<Future<void> Function(int milliseconds, int rate)>((ref) {
  return (int milliseconds, int interval) async {
    ref.read(showLoadingDialog)();
    ref.watch(loadingValue.notifier).update((_) => 0.0);

    final timer = Timer.periodic(Duration(milliseconds: interval), (t) {
      ref.watch(loadingValue.notifier).update((state) {
        if (state == null) {
          return 0.0;
        }
        if (state == 1.0) {
          return 1.0;
        }
        return state + (1.0 / (milliseconds / interval));
      });
    });
    await Future.delayed(Duration(milliseconds: milliseconds));
    timer.cancel();
    ref.refresh(loadingValue);
  };
});

/// errorMessage / successMessage を渡すことで、snackBar を表示させられる。
final hideLoadingDialog =
    Provider<void Function({String? errorMessage, String? successMessage})>(
        (ref) {
  return ({String? errorMessage, String? successMessage}) {
    ref.read(_isLoading.notifier).update((_) => false);

    if (errorMessage != null) {
      scaffoldMessengerKey.show(errorMessage,
          backgroundColor: Colors.redAccent);
    }

    if (successMessage != null) {
      scaffoldMessengerKey.show(successMessage, backgroundColor: Colors.blue);
    }
  };
});

class LoadingDialog extends ConsumerStatefulWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends ConsumerState<LoadingDialog> {
  /// loadingValue が refresh された後に、value に null を渡さないようにするため
  var hasLoadingValue = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    ref.listen<bool>(_isLoading, ((_, next) {
      if (mounted) {
        Navigator.pop(context);
      }
    }));

    ref.listen<double?>(loadingValue, ((previous, next) {
      setState(() {
        hasLoadingValue = previous != null || next != null;
      });
    }));
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              value: ref.watch(loadingValue) ?? (hasLoadingValue ? 1.0 : null),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text('ローティングなう'),
        ],
      ),
      contentPadding: const EdgeInsets.all(32),
    );
  }
}
