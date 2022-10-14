import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_workspace/common/extensions/build_context_extension.dart';

class NandemonaiDialog extends StatelessWidget {
  const NandemonaiDialog({super.key, this.onPressed});

  final VoidCallback? onPressed;

  static Future<void> show(BuildContext context) {
    return showDialog(
        context: context, builder: (_) => const NandemonaiDialog());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('何でもないダイアログです'),
      actions: [
        TextButton(
          child: const Text('閉じる'),
          onPressed: context.pop,
        ),
        ElevatedButton(
          child: const Text('なんかする'),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
