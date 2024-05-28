import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

/// A BLoC responsible for managing to-do tasks.
class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoTask = [];

  ToDoBloc() : super(const ToDoState()) {
    // Listen to AddTodoEvent and execute _addTodoEvent function
    on<AddTodoEvent>(_addTodoEvent);
    // Listen to DeleteTodoEvent and execute _deleteTodoEvent function
    on<DeleteTodoEvent>(_deleteTodoEvent);
  }

  /// Adds a new to-do task.
  void _addTodoEvent(AddTodoEvent event, Emitter<ToDoState> states) {
    todoTask.add(event.task);
    states(state.copyWith(todoEvent: List.from(todoTask)));
  }

  /// Deletes a to-do task.
  void _deleteTodoEvent(DeleteTodoEvent event, Emitter<ToDoState> states) {
    todoTask.remove(event.task);
    states(state.copyWith(todoEvent: List.from(todoTask)));
  }
}
