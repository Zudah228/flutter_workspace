import 'package:flutter/material.dart';
import 'package:flutter_workspace/main.dart';
import 'package:flutter_workspace/pages/nandemonai/nandemonai_material_page.dart';
import 'package:flutter_workspace/pages/nandemonai/nandemonai_page.dart';
import 'package:flutter_workspace/pages/scaffold_messenger_key/widgets/snack_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldMessengerKeyPage extends HookConsumerWidget {
  const ScaffoldMessengerKeyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScaffoldMessengerKey')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  AlertSnackBar.show(scaffoldMessengerKey.currentState!,
                      text: 'いえあ');
                },
                child: const Text('show SnackBar')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(NandemonaiPage.route(
                      btnText: 'ページ戻って showSnackBar',
                      onPressed: (newPageContext) {
                        Navigator.of(newPageContext).pop();
                        AlertSnackBar.show(scaffoldMessengerKey.currentState!,
                            text: 'いえあ');
                      }));
                  AlertSnackBar.show(scaffoldMessengerKey.currentState!,
                      text: 'いえあ');
                },
                child: const Text('ページ遷移して show SnackBar')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(NandemonaiPage.route(
                      btnText: 'ページ戻って showSnackBar',
                      onPressed: (newPageContext) {
                        Navigator.of(newPageContext).pop();
                        AlertSnackBar.show(scaffoldMessengerKey.currentState!,
                            text: 'いえあ');
                      }));
                  AlertSnackBar.show(ScaffoldMessenger.of(context),
                      text: 'いえあ');
                },
                child: const Text('ページ遷移して、今のページの contextで show SnackBar')),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (dialogContext) => Dialog(
                            child: TextButton(
                              onPressed: Navigator.of(dialogContext).pop,
                              child: const Text('閉じる'),
                            ),
                          ));
                  AlertSnackBar.show(ScaffoldMessenger.of(context),
                      text: 'いえあ');
                },
                child: const Text('Dialog 出して show SnackBar')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(NandemonaiMaterialPage.route(
                      btnText: 'ページ戻って、ここの context で showSnackBar',
                      onPressed: (newPageContext) {
                        Navigator.of(newPageContext).pop();
                        AlertSnackBar.show(ScaffoldMessenger.of(newPageContext),
                            text: 'いえあ');
                      }));
                  AlertSnackBar.show(scaffoldMessengerKey.currentState!,
                      text: 'いえあ');
                },
                child: const Text('Scaffold じゃないページへ遷移して show SnackBar')),
          ],
        ),
      ),
    );
  }
}
