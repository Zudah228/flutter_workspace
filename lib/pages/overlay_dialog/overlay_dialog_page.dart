import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/overlay_dialog/widgets/_exports.dart';
import 'package:flutter_workspace/pages/overlay_dialog/widgets/flutter_toast_alert_dialog.dart';

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
        title: const Text('自動で閉じるダイアログ'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              '2秒後に閉じるよ',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 40,
            ),


            const Text(
              'Navigator.overlay で開く',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              child: const Text('AlertDialog'),
              onPressed: () {
                showOverlayToast(context);
              },
            ),
            ElevatedButton(
              child: const Text('bottom popup'),
              onPressed: () {
                showOverlayToastBottom(context);
              },
            ),
            ElevatedButton(
              child: const Text('アニメーション付き bottom popup'),
              onPressed: () {
                showOverlayToastAnimatedBottom(context);
              },
            ),
          
            
            const SizedBox(
              height: 20,
            ),
            const Text(
              'showDialog で開く',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              child: const Text('AlertDialog'),
              onPressed: () {
                showNavigatorToast(context);
              },
            ),

            const SizedBox(
              height: 20,
            ),  
            const Text(
              'flutter_toast で開く',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              child: const Text('No BuildContext で開く'),
              onPressed: () {
                showFlutterToastNoBuildContext();
              },
            ),
            ElevatedButton(
              child: const Text('AlertDialog'),
              onPressed: () {
                showFlutterToast(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
