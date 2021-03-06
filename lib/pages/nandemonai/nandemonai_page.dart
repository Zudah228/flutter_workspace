import 'package:flutter/material.dart';

class NandemonaiPage extends StatelessWidget {
  const NandemonaiPage({Key? key, this.onPressed, this.btnText})
      : super(key: key);

  final void Function(BuildContext)? onPressed;
  final String? btnText;

  static Route route(
          {void Function(BuildContext)? onPressed, String? btnText}) =>
      MaterialPageRoute<void>(
          builder: (context) => NandemonaiPage(
                btnText: btnText,
                onPressed: onPressed,
              ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ここは、何でもないページ'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
