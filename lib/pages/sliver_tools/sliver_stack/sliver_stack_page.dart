import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:uuid/uuid.dart';

import '../../../common/entities/todo/todo.dart';
import '../../../common/types/types.dart';
import '../../../common/extensions/build_context_extension.dart';
import '../../../common/extensions/form_field_key_extension.dart';
import 'widgets/sliver_decorated_box.dart';

const _uuid = Uuid();

const _horizontalPadding = EdgeInsets.symmetric(horizontal: 24);
const _listTilePadding = EdgeInsets.symmetric(vertical: 24, horizontal: 16);
const _mainColor = Colors.blue;

BoxDecoration get _listDecoration => BoxDecoration(
    color: _mainColor.shade100, borderRadius: BorderRadius.circular(8));
Color get _textColor => _mainColor.shade900;

class SliverStackPage extends StatefulWidget {
  const SliverStackPage({Key? key}) : super(key: key);

  @override
  State<SliverStackPage> createState() => _SliverStackPageState();
}

class _SliverStackPageState extends State<SliverStackPage> {
  final _formKey = FormKeyStr();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Todo> allTodos = [];
  List<Todo> get todos => allTodos
      .where(
        (element) => element.isArchived != true,
      )
      .toList();
  List<Todo> get archivedTodos => allTodos
      .where(
        (element) => element.isArchived == true,
      )
      .toList();

  void _add({String? argTitle}) {
    late final String title;

    if (argTitle == null) {
      if (!_formKey.validate()) return;
      title = _formKey.currentValue;
    } else {
      title = argTitle;
    }

    final todo = Todo(
        title: title,
        createdAt: DateTime.now(),
        isCompleted: false,
        todoId: _uuid.v4());
    _formKey.clear();
    setState(() {
      allTodos.add(todo);
    });
  }

  void _toggleArchive(String todoId, bool value) {
    setState(() {
      allTodos = [
        for (final todo in allTodos)
          if (todo.todoId == todoId) todo.copyWith(isArchived: value) else todo
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('SliverStack Page')),
      body: CustomScrollView(
        slivers: [
          // header
          SliverPinnedHeader(
              child: DecoratedBox(
            decoration: BoxDecoration(
                color: _scaffoldKey.currentState?.widget.backgroundColor ??
                    context.scaffoldBackgroundColor),
            child: Padding(
              padding: _horizontalPadding +
                  const EdgeInsets.only(top: 16, bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: _formKey,
                      validator: (value) {
                        if (value!.isEmpty) return 'required';
                        return null;
                      },
                      onChanged: (_) => _formKey.validate(),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(onPressed: _add, child: const Icon(Icons.add))
                ],
              ),
            ),
          )),

          // SliverStack を直接使用する
          SliverPadding(
            padding: _horizontalPadding,
            sliver: SliverStack(children: [
              // background
              SliverPositioned.fill(
                  child: DecoratedBox(decoration: _listDecoration)),

              // list
              SliverPadding(
                padding: _listTilePadding,
                sliver: SliverVisibility(
                  visible: todos.isNotEmpty,
                  sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    final todo = todos[index];

                    return Column(
                      children: [
                        // ListTile
                        _ListTile(todo: todo, toggleArchive: _toggleArchive),

                        const SizedBox(
                          height: 16,
                        ),
                        if (todos.length - index == 1)
                          ElevatedButton(
                              onPressed: () {
                                for (var i = 0; i < 10; i++) {
                                  _add(argTitle: '$i: ${_uuid.v4()}');
                                }
                              },
                              child: const Text('add 10 items'))
                      ],
                    );
                  }, childCount: todos.length)),
                  replacementSliver: SliverToBoxAdapter(
                    child: Center(
                        child: Text(
                      'No  Data',
                      style: TextStyle(color: _textColor),
                    )),
                  ),
                ),
              )
            ]),
          ),

          // isArchived == true の一覧
          // SliverStack を SliverDecoratedBox に切り出して使用する。
          SliverVisibility(
              visible: archivedTodos.isNotEmpty,
              sliver: SliverPadding(
                padding: _horizontalPadding + const EdgeInsets.only(top: 64),
                sliver: SliverDecoratedBox(
                    decoration: _listDecoration,
                    padding: _listTilePadding,
                    sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      final todo = archivedTodos[index];
                      return Column(
                        children: [
                          _ListTile(
                            todo: todo,
                            toggleArchive: _toggleArchive,
                          ),
                          if (archivedTodos.length - index != 1)
                            const SizedBox(
                              height: 16,
                            ),
                        ],
                      );
                    }, childCount: archivedTodos.length))),
              )),

          // footer space
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 64,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({Key? key, required this.todo, required this.toggleArchive})
      : super(key: key);

  final Todo todo;
  final void Function(String todoId, bool value) toggleArchive;

  bool get isArchived => todo.isArchived == true;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: _mainColor.shade300, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(DateFormat('yyyy/M/d HH:mm:ss').format(todo.createdAt)),
        trailing: IconButton(
          onPressed: () {
            toggleArchive(todo.todoId, !isArchived);
          },
          icon: Icon(isArchived ? Icons.file_upload_outlined : Icons.archive),
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
