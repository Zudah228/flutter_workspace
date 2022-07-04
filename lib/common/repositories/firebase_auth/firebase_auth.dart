import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((_) {
  return FirebaseAuthRepository(FirebaseAuth.instance);
});

class FirebaseAuthRepository {
  FirebaseAuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Stream<User?> get onUserChanged => _auth.userChanges();

  User? get authUser => _auth.currentUser;

  String? get loggedInUserId => _auth.currentUser?.uid;

  bool get isAnonymously => _auth.currentUser?.isAnonymous ?? false;

  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  Future<String?> get idToken async {
    return _auth.currentUser?.getIdToken(true);
  }
  Future<void> get reload async {
    return _auth.currentUser?.reload();
  }

  Future<UserCredential> signInWithAnonymously() => _auth.signInAnonymously();

  Future<UserCredential> signInWithAuthCredential(
    AuthCredential authCredential,
  ) =>
      _auth.signInWithCredential(authCredential);

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<void> sendEmailVerification(User user) => user.sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email) =>
      _auth.sendPasswordResetEmail(email: email);

  Future<UserCredential> signInWithLink(AuthCredential authCredential) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('user is null');
    }
    return user.linkWithCredential(authCredential);
  }

  Future<void> userDelete(User user) => user.delete();

  Future<void> signOut() => _auth.signOut();
}
