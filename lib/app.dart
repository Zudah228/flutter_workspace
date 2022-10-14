import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/scaffold_messenger_key/widgets/snack_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/providers/navigator_key_provider.dart';
import 'pages/home_page.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

extension ScaffoldMessengerEx on GlobalKey<ScaffoldMessengerState> {
  void show(String text, {Color? backgroundColor}) =>
      AlertSnackBar.show(currentState!,
          text: text, backgroundColor: backgroundColor);
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      navigatorKey: ref.watch(navigatorKeyProvider),
      navigatorObservers: [routeObserver],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
