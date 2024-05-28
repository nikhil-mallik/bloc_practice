part of 'switch_bloc.dart';

//ignore: must_be_immutable
/// Class representing the states of switches and sliders.
class SwitchStates extends Equatable {
  final bool isSwitch;
  final double slider;

  /// Constructor to initialize the switch and slider states.
  const SwitchStates({this.isSwitch = false, this.slider = 0.5});

  /// Method to create a new state with updated values.
  SwitchStates copyWith({bool? isSwitch, double? slider}) {
    return SwitchStates(
      isSwitch: isSwitch ?? this.isSwitch,
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object?> get props => [isSwitch, slider];
}
