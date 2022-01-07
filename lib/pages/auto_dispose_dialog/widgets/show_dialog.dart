import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_workspace/pages/nandemonai/nandemonai_page.dart';

Future<void> showNavigatorToast(BuildContext context) async {
  try {
    final result = await showDialog(
      context: context,
      builder: (_) => const _Dialog()
    ).timeout(const Duration(seconds: 2));

    if (result) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const NandemonaiPage()),
        );
    }

  } on TimeoutException {
    Navigator.pop(context);
  }
}

class _Dialog extends StatelessWidget {
  const _Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('showDialog で開いたよ'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text(
            'なんでもないページへ遷移',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          )
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('閉じる'),
        )
      ],
    );
  }
}
