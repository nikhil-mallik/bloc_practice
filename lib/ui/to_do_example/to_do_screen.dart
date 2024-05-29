import 'package:flutter/material.dart';

import '../../bloc/to_do_example/to_do_bloc.dart';
import '../views.dart';

/// A screen to display and manage to-do tasks.
class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<ToDoBloc, ToDoState>(
            builder: (context, state) {
              // If no to-do tasks are available, display a message
              if (state.todoEvent.isEmpty) {
                return const Center(
                  child: Text('No Event found'),
                );
              }
              // If to-do tasks are available, display them in a list
              else if (state.todoEvent.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.todoEvent.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todoEvent[index]),
                      // Add a delete button to each to-do task
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
                  },
                );
              }
              // Handle any other cases
              else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
      // Add a floating action button to add new to-do tasks
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add 6 new to-do tasks when the button is pressed
          for (int i = 0; i < 6; i++) {
            context.read<ToDoBloc>().add(AddTodoEvent(task: 'Task: $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
