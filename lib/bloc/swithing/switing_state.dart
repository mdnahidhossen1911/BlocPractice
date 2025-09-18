import 'package:equatable/equatable.dart';

class SwitingState extends Equatable {
  final bool switching;
  final double sliderValue;

  const SwitingState({this.switching = false, this.sliderValue = 1.0});

  SwitingState copyWith({bool? switching, double? sliderValue}) {
    return SwitingState(
      switching: switching ?? this.switching,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [switching,sliderValue];
}
