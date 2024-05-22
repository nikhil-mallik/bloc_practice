import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/switch_example/switch_event.dart';
import 'package:bloc_practice/bloc/switch_example/switch_states.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableDisableNotification);
    on<SliderEvents>(_sliderFunction);
  }

  void _enableDisableNotification(
      EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
    // passing value through state
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderFunction(SliderEvents events, Emitter<SwitchStates> emit) {
    // passing value through events.
    // getting value through the events.
    emit(state.copyWith(slider: events.sliderVal.toDouble()));
  }
}
