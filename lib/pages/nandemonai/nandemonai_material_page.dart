import 'package:flutter/material.dart';

class NandemonaiMaterialPage extends StatelessWidget {
  const NandemonaiMaterialPage({Key? key, this.onPressed, this.btnText})
      : super(key: key);

  final void Function(BuildContext)? onPressed;
  final String? btnText;

  static Route route(
          {void Function(BuildContext)? onPressed, String? btnText}) =>
      MaterialPageRoute<void>(
          builder: (context) => NandemonaiMaterialPage(
                btnText: btnText,
                onPressed: onPressed,
              ));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(onPressed: () {Navigator.of(context).pop();}, child: const Text('戻る')),
          const Text('ナンでもない'),
          const Text('NaN でもない'),
          if (btnText != null) ...[
            const SizedBox(
              height: 16,
            ),
            Text(btnText!)
          ],
          ElevatedButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed!(context);
                }
              },
              child: const Text('なんかのボタン')),
        ],
      )),
    );
  }
}
