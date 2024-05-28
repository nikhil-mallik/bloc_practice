part of 'counter_bloc.dart';

// CounterState class that extends Equatable to ensure value equality.
class CounterState extends Equatable {
  // Final integer variable to hold the counter value.
  final int counter;

  // Constructor for CounterState with an optional named parameter for counter.
  // Default value for counter is set to 0.
  const CounterState({this.counter = 0});

  // Method to create a copy of the current state with an updated counter value.
  // If a new counter value is not provided, it uses the existing counter value.
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  // Overriding props method to include counter for value comparison.
  @override
  List<Object> get props => [counter];
}
