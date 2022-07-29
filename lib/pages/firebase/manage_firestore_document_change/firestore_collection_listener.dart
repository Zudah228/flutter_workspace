import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class FirestoreCollectionListener<T extends Object> {
  StreamSubscription? disposer;
  late BehaviorSubject<List<DocumentChange<T>>> listener;

  void listen(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    disposer = FirebaseFirestore.instance
        .collection(path)
        .withConverter<T>(
            fromFirestore: (doc, __) => fromJson(doc.data()!),
            toFirestore: (_, __) => {})
        .snapshots()
        .listen((event) {
      listener.add(event.docChanges);
    });
  }
}
