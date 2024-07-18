import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';
import 'package:flutter_riverpod_app/presentation/providers/providers.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/todo.dart';

const uuid = Uuid();

enum TodoFilter {all,completed,pending}

final todoFilterProvider = StateProvider<TodoFilter>((ref) {
  return TodoFilter.all;
});

final todosProvider = StateProvider<List<Todo>>((ref) {
  return [
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ];
});

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosProvider);
  switch(selectedFilter){
    case TodoFilter.all:
      return todos;
    case TodoFilter.completed:
      return todos.where((element) => element.done).toList();
    case TodoFilter.pending:
      return todos.where((element) => !element.done).toList();
  }
});

final filteredTodosStateProvider = Provider<List<Todo>>((ref) {
  final selectedFilter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosStateNotifierProvider);
  switch(selectedFilter){
    case TodoFilter.all:
      return todos;
    case TodoFilter.completed:
      return todos.where((element) => element.done).toList();
    case TodoFilter.pending:
      return todos.where((element) => !element.done).toList();
  }
});