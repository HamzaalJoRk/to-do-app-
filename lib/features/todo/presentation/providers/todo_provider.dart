import 'package:flutter/material.dart';
import '../../data/local_data/local_data_source.dart';
import '../../data/models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final LocalDataSource localDataSource;

  TodoProvider({required this.localDataSource});

  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  Future<void> fetchTodos() async {
    _todos = await localDataSource.getTodos();
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    final newTodo = TodoModel(title: title);
    await localDataSource.addTodo(newTodo);
    await fetchTodos();
  }

  Future<void> updateTodo(TodoModel todo) async {
    await localDataSource.updateTodo(todo);
    await fetchTodos();
  }

  Future<void> toggleTodoCompletion(TodoModel todo) async {
    final updatedTodo = TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: !todo.isCompleted,
    );
    await localDataSource.updateTodo(updatedTodo);
    await fetchTodos();
  }

  Future<void> deleteTodo(int id) async {
    await localDataSource.deleteTodo(id);
    await fetchTodos();
  }
}
