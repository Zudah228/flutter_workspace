import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/entities/todo/todo.dart';
import '../../../common/repositories/firestore/collection_paging_repository.dart';

class QueryIndexErrorPage extends ConsumerStatefulWidget {
  const QueryIndexErrorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QueryIndexErrorPageState();
}

class _QueryIndexErrorPageState extends ConsumerState<QueryIndexErrorPage> {
  List<Todo> todos = [];
  List<Todo> errorTodos = [];

  CollectionPagingRepository<Todo> get todoRepository =>
      ref.watch(todoCollectionComplexQueryPagingRepositoryProvider);
  CollectionPagingRepository<Todo> get todoErrorRepository =>
      ref.watch(todoCollectionErrorComplexQueryPagingRepositoryProvider);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future(() async {
        try {
          final docs = await todoRepository.fetch();
          setState(() {
            todos = [...docs.map((e) => e.entity!)];
          });

          final errorDocs = await todoErrorRepository.fetch();
          errorTodos = [...errorDocs.map((e) => e.entity!)];
        } catch (e, s) {
          print(e);
          print(s);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('正常'),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: todos.length,
                  itemBuilder: ((context, index) {
                    final todo = todos[index];
                    return SizedBox(
                      width: 100,
                      child: Card(
                        child: Center(child: Text(todo.title)),
                      ),
                    );
                  })),
            ),
            const SizedBox(
              height: 64,
            ),
            const Text('エラー起こす用'),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: errorTodos.length,
                  itemBuilder: ((context, index) {
                    final todo = errorTodos[index];
                    return SizedBox(
                      width: 100,
                      child: Card(
                        child: Center(child: Text(todo.title)),
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
