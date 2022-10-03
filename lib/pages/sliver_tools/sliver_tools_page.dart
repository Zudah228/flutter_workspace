import 'package:flutter/material.dart';

import '../../common/extensions/build_context_extension.dart';
import 'sliver_stack/sliver_stack_page.dart';

class SliverToolsPage extends StatelessWidget {
  const SliverToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliver Tools Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => context.push(const SliverStackPage()),
                child: const Text('SliverStack')),
          ],
        ),
      ),
    );
  }
}
