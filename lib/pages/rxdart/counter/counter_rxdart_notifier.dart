import 'dart:async';

import 'package:flutter_workspace/common/entities/counter/counter.dart';
import 'package:flutter_workspace/common/repositories/firebase_firestore_repository.dart';
import 'package:flutter_workspace/pages/rxdart/counter/states/counter_rxdart_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final counterRxdartPageProvider = StateNotifierProvider.autoDispose<
    CounterRxdartPageNotifier,
    CounterRxdartState>(((ref) => CounterRxdartPageNotifier(ref.read)));

class CounterRxdartPageNotifier extends StateNotifier<CounterRxdartState> {
  CounterRxdartPageNotifier(this.read) : super(CounterRxdartState());

  final Reader read;
  final _snapshotController = BehaviorSubject<int>();
  StreamSubscription? _disposer;

  late final _firestoreDocumentRepository =
      read(firestoreDocumentRepositoryProvider);
  late final _transaction =
      _firestoreDocumentRepository.transaction((transaction) async {
    final doc = await transaction
        .get(_firestoreDocumentRepository.docRef(Counter.documentPath));
    if (!doc.exists) {
      transaction.set(_firestoreDocumentRepository.docRef(Counter.documentPath),
          Counter(count: 0).toJson());
    }
  });

  Future<void> fetch() async {
    try {
      final doc = await _firestoreDocumentRepository
          .fetch<Counter>(Counter.documentPath, decode: Counter.fromJson);

      if (doc.exists) {
        state = state.copyWith(
          count: doc.entity!.count,
        );
      }
    } catch (e) {
      print('counter fetch失敗');
    }
  }

  void listen() {
    _snapshotController.listen((value) {
      state = state.copyWith(
        count: value,
      );
    });
    _disposer = _firestoreDocumentRepository
        .snapshots(Counter.documentPath)
        .listen((event) {
      if (!event.exists) {
        return;
      }
      try {
        _snapshotController.add(Counter.fromJson(event.data()!).count);
      } catch (e) {
        print(e);
        print('counter stream取得失敗');
      }
    });
  }

  Future<void> increase() async {
    _transaction.then((value) {
      _firestoreDocumentRepository.update(Counter.documentPath,
          data: Counter.updateCountMap(1));
    });
  }

  Future<void> decrease() async {
    _transaction.then((value) {
      _firestoreDocumentRepository.update(Counter.documentPath,
          data: Counter.updateCountMap(-1));
    });
  }

  @override
  void dispose() async {
    await  _disposer?.cancel();
    await _snapshotController.close();
    super.dispose();
  }
}
