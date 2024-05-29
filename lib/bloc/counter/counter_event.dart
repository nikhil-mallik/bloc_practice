part of 'counter_bloc.dart';

/// Abstract class CounterEvent that extends Equatable to ensure value equality.
abstract class CounterEvent extends Equatable {
  // Constructor for CounterEvent.
  const CounterEvent();

  // Overriding props method to return an empty list for value comparison.
  @override
  List<Object> get props => [];
}

/// IncrementCounter class that extends CounterEvent to represent an increment event.
class IncrementCounter extends CounterEvent {}

/// DecrementCounter class that extends CounterEvent to represent a decrement event.
class DecrementCounter extends CounterEvent {}
