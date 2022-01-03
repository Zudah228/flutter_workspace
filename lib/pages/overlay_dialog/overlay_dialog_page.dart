import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/overlay_dialog/navigator_toast.dart';
import 'package:flutter_workspace/pages/overlay_dialog/overlay_toast.dart';

class OverlayDialogPage extends StatefulWidget {
  const OverlayDialogPage({Key? key}) : super(key: key);

  @override
  State<OverlayDialogPage> createState() => _OverlayDialogPageState();
}

class _OverlayDialogPageState extends State<OverlayDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自動で閉じるトースト'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('overlay で開く'),
              onPressed: () {
                setState(() {
                  showOverlayToast(context);
                });
              },
            ),
            ElevatedButton(
              child: const Text('showDialog で開く'),
              onPressed: () {
                showNavigatorToast(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
