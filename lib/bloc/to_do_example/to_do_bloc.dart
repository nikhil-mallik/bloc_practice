import 'package:bloc/bloc.dart';

import 'to_do_event.dart';
import 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todoTask = [];
  ToDoBloc() : super(const ToDoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<DeleteTodoEvent>(_deleteTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<ToDoState> states) {
    todoTask.add(event.task);
    states(state.copyWith(todoEvent: List.from(todoTask)));
  }

  void _deleteTodoEvent(DeleteTodoEvent event, Emitter<ToDoState> states) {
    todoTask.remove(event.task);
    states(state.copyWith(todoEvent: List.from(todoTask)));
  }
}
