import 'package:equatable/equatable.dart';

class ToDoState extends Equatable {
  final List<String> todoEvent;
  const ToDoState({this.todoEvent = const []});

  ToDoState copyWith({List<String>? todoEvent}) {
    return ToDoState(todoEvent: todoEvent ?? this.todoEvent);
  }

  @override
  List<Object> get props => [todoEvent];
}
