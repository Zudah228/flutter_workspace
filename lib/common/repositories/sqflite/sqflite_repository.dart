import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

typedef JSON = Map<String, Object?>;

final todoSqfliteProvider =
    Provider<SqfliteRepository>((_) => throw UnimplementedError());

class SqfliteRepository<T extends Object> {
  const SqfliteRepository(
    this._db, {
    required this.decode,
  });
  final Database _db;
  final T Function(JSON) decode;

  Future<void> _execute() async {
    await _db.execute('CREATE TABLE ${_db.path} ');
  }

  Future<void> insert() async {}

  Future<List<Object>> query() async {
    final list = await _db.query(
      _db.path,
    );
    return list.map((e) => decode(e)).toList();
  }
}
