import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/to_do_example/to_do_bloc.dart';
import '../../bloc/to_do_example/to_do_event.dart';
import '../../bloc/to_do_example/to_do_state.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if (state.todoEvent.isEmpty) {
              return const Center(
                child: Text('No Event found'),
              );
            } else if (state.todoEvent.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.todoEvent.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todoEvent[index]),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<ToDoBloc>().add(
                                DeleteTodoEvent(task: state.todoEvent[index]),
                              );
                        },
                        icon: const Icon(Icons.delete_forever_outlined),
                        color: Colors.red,
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 6; i++) {
            context.read<ToDoBloc>().add(AddTodoEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
