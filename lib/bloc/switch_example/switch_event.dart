import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

//ignore: must_be_immutable
class SliderEvents extends SwitchEvents {
  double sliderVal;
  SliderEvents({required this.sliderVal});

  @override
  List<Object> get props => [sliderVal];
}
