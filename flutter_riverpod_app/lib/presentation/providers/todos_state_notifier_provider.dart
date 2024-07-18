import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';
import 'package:flutter_riverpod_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final todosStateNotifierProvider = StateNotifierProvider<TodosNotifier,List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ]);

        void addTodo(){
          state = [...state, Todo(
            id: _uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null
          )];
        }

        void toggleTodo(String id){
          state = state.map((todo){
            if(todo.id != id) return todo;
            if (todo.done) return todo.copyWith(completedAt: null);
            return todo.copyWith(completedAt: DateTime.now());
          }).toList();
        }
}
