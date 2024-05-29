import 'package:bloc_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CounterScreen class which is a stateless widget to display the counter UI.
class CounterScreen extends StatelessWidget {
  // Constructor for CounterScreen, accepting a key.
  const CounterScreen({super.key});

  // Overriding the build method to define the UI of the CounterScreen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with the title "Counter Example".
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      // Body of the Scaffold containing a Column widget.
      body: SafeArea(
        child: Column(
          children: [
            // Spacer to provide some vertical space.
            const SizedBox(height: 45),
            // BlocBuilder to rebuild the UI based on the state of CounterBloc.
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              // Center widget to center the counter text.
              return Center(
                child: Text(
                  state.counter.toString(), // Displaying the counter value.
                  style: const TextStyle(fontSize: 40), // Styling the text.
                ),
              );
            }),
            // Row widget to align the buttons horizontally.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button to increment the counter.
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Increment'),
                ), // Spacer between the buttons.
                const SizedBox(width: 10), // Button to decrement the counter.
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('Decrement'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
