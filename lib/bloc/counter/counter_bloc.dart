import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// Defining the CounterBloc class which extends Bloc with CounterEvent as the event type
// and CounterState as the state type.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Constructor for CounterBloc that initializes the state with a default CounterState.
  CounterBloc() : super(const CounterState()) {
    // Registering the _increment function to handle IncrementCounter events.
    on<IncrementCounter>(_increment);

    // Registering the _decrement function to handle DecrementCounter events.
    on<DecrementCounter>(_decrement);
  }

  // Private method to handle IncrementCounter events.
  // It emits a new state with the counter incremented by 2.
  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 2));
  }

  // Private method to handle DecrementCounter events.
  // It emits a new state with the counter decremented by 2.
  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 2));
  }
}
