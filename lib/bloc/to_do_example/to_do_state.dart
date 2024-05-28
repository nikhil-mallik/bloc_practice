part of 'to_do_bloc.dart';

/// Class representing the state of the to-do task list.
class ToDoState extends Equatable {
  final List<String> todoEvent;

  /// Constructs a ToDoState instance with an optional list of to-do events.
  const ToDoState({this.todoEvent = const []});

  /// Copies the current state with optional modifications to the list of to-do events.
  ToDoState copyWith({List<String>? todoEvent}) {
    return ToDoState(todoEvent: todoEvent ?? this.todoEvent);
  }

  @override
  List<Object> get props => [todoEvent];
}
