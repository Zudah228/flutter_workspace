import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_workspace/common/repositories/firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateChange = StateNotifierProvider<AuthStateChangeNotifier, User?>(
    (ref) => AuthStateChangeNotifier(ref.read(firebaseAuthRepositoryProvider)));

class AuthStateChangeNotifier extends StateNotifier<User?> {
  AuthStateChangeNotifier(this._auth) : super(null);
  final FirebaseAuthRepository _auth;

  StreamSubscription? _disposer;
  Timer? _timer;

  @override
  void dispose() {
    _disposer?.cancel();
    super.dispose();
  }

  void call() {
    const twentyMillis = Duration(milliseconds: 20);

    _disposer = _auth.onUserChanged.listen((event) {
      _timer?.cancel();
  
      // emailVerified が確認できない場合のみ、タイマーを起動する
      if (event?.emailVerified == false) {
        _timer = Timer(twentyMillis, () => _auth.reload);
      }

      state = event;
    });
  }
}
