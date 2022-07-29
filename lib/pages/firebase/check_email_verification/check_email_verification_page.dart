import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/common/extensions/build_context_extension.dart';
import 'package:flutter_workspace/common/repositories/firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_state_change.dart';

class CheckEmailVerificationPage extends HookConsumerWidget {
  const CheckEmailVerificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(firebaseAuthRepositoryProvider);
    final userNotifier = ref.watch(authStateChange.notifier);
    final user = ref.watch(authStateChange);

    final email = useTextEditingController();
    final password = useTextEditingController();

    useEffect(() {
      userNotifier();
      return;
    }, const []);

    return Scaffold(
      appBar: AppBar(title: const Text('Firebase auth state change')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: 'password'),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            Text(user == null ? 'サインインしていない' : 'サインイン済み'),
            Text('uid: ${user?.uid}'),
            Text('email verified: ${user?.emailVerified}'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: user != null
                  ? null
                  : () async {
                      UserCredential? credential;
                      // 新規作成→すでに存在→サインイン
                      try {
                        credential = await auth.createUserWithEmailAndPassword(
                            email.text, password.text);
                      } on FirebaseException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          credential = await auth.signInWithEmailAndPassword(
                              email.text, password.text);
                          return;
                        }
                        rethrow;
                      } on Exception catch (e) {
                        context.showSnackBar(e.toString());
                        print(e);
                        return;
                      }
                      context.showSnackBar('サインイン成功: ${credential.user?.uid}');
                    },
              child: const Text('サインイン'),
            ),
            ElevatedButton(
              onPressed: user == null
                  ? null
                  : () async {
                      await auth.sendEmailVerification(user);
                      context.showSnackBar('確認メールを送信しました');
                    },
              child: const Text('確認メールを送る'),
            ),
            ElevatedButton(
              onPressed: user == null
                  ? null
                  : () async {
                      await auth.signOut();
                    },
              child: const Text('サインアウト'),
            )
          ],
        ),
      ),
    );
  }
}
