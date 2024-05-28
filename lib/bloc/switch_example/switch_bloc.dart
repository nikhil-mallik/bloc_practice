import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_states.dart';

/// Bloc responsible for managing the state of switches and sliders.
class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(const SwitchStates()) {
    // Handling events to enable or disable notifications.
    on<EnableOrDisableNotification>(_enableDisableNotification);
    // Handling events related to slider functionality.
    on<SliderEvents>(_sliderFunction);
  }

  // Function to handle enabling or disabling notifications.
  void _enableDisableNotification(
      EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
    // Toggling the switch value and updating the state accordingly.
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  // Function to handle slider functionality.
  void _sliderFunction(SliderEvents events, Emitter<SwitchStates> emit) {
    // Updating the slider value based on the event.
    emit(state.copyWith(slider: events.sliderVal.toDouble()));
  }
}

