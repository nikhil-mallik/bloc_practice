part of 'to_do_bloc.dart';

/// Abstract class representing events related to to-do tasks.
abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

/// Event to add a new to-do task.
class AddTodoEvent extends ToDoEvent {
  final String task;
  const AddTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}

/// Event to delete an existing to-do task.
class DeleteTodoEvent extends ToDoEvent {
  final Object task;
  const DeleteTodoEvent({required this.task});

  @override
  List<Object> get props => [task];
}
