import 'package:equatable/equatable.dart';

abstract class SwitingEvent extends Equatable{
  const SwitingEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnOrOff extends SwitingEvent {}

class SliderChanged extends SwitingEvent {
  final double value;
  const SliderChanged(this.value);

  @override
  List<Object> get props => [value];
}