import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'document.dart';

final firestoreDocumentRepositoryProvider = Provider<DocumentRepository>((ref) {
  return DocumentRepository(FirebaseFirestore.instance);
});

class DocumentRepository {
  DocumentRepository(this._firestore);

  final FirebaseFirestore _firestore;

  WriteBatch get batch => _firestore.batch();

  Future<void> save(
    String documentPath, {
    required Map<String, dynamic> data,
  }) async {
    final doc = _firestore.doc(documentPath);
    await doc.set(
      data,
      SetOptions(merge: true),
    );
  }

  Future<void> update(
    String documentPath, {
    required Map<String, dynamic> data,
  }) async {
    final doc = _firestore.doc(documentPath);
    await doc.update(data);
  }

  Future<Document<T>> fetch<T extends Object>(
    String documentPath, {
    Source source = Source.serverAndCache,
    void Function(Document<T>?)? fromCache,
    required T Function(Map<String, dynamic>) decode,
  }) async {
    if (fromCache != null) {
      try {
        final cache = await _firestore
            .doc(documentPath)
            .get(const GetOptions(source: Source.cache));
        fromCache(Document(
          ref: cache.reference,
          exists: cache.exists,
          entity: cache.exists == true ? decode(cache.data()!) : null,
        ));
      } on Exception catch (_) {
        // ignore exception
        fromCache(null);
      }
    }

    final snap =
        await _firestore.doc(documentPath).get(GetOptions(source: source));
    return Document(
      ref: snap.reference,
      exists: snap.exists,
      entity: snap.exists ? decode(snap.data()!) : null,
    );
  }

  Future<void> delete(String documentPath) async {
    await _firestore.doc(documentPath).delete();
  }

  Stream<DocumentSnapshot<SnapType>> snapshots(String documentPath) =>
      _firestore.doc(documentPath).snapshots();

  Future<T> transaction<T>(TransactionHandler<T> transactionHandler) =>
      _firestore.runTransaction<T>(transactionHandler);

  DocumentReference docRef(String documentPath) => _firestore.doc(documentPath);
}
