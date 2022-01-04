import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/_exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            _NavigateButton(
              btnText: '2022/1/3 自動で閉じるダイアログ',
              page: OverlayDialogPage())
          ],
        ),
      ),
    );
  }
}

class _NavigateButton extends StatelessWidget {
  const _NavigateButton({
    Key? key,
    required this.btnText,
    required this.page,
  }) : super(key: key);

  final String btnText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(btnText),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => page),
        );
      },
    );
  }
}
