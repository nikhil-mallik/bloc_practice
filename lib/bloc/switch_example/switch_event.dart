part of 'switch_bloc.dart';

/// Abstract class representing events for switches and sliders.
abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

/// Event for enabling or disabling notifications.
class EnableOrDisableNotification extends SwitchEvents {}

/// Event for slider changes.
class SliderEvents extends SwitchEvents {
  final double sliderVal;
  const SliderEvents({required this.sliderVal});

  @override
  List<Object> get props => [sliderVal];
}
