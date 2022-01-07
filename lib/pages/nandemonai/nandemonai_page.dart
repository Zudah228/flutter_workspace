import 'package:flutter/material.dart';

class NandemonaiPage extends StatelessWidget {
  const NandemonaiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ここは、何でもないページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('ナンでもない'),
            Text('NaN でもない'),
          ],
        )
      ),
    );
  }
}
