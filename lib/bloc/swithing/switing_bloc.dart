import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/swithing/switing_event.dart';
import 'package:bloc_practice/bloc/swithing/switing_state.dart';


class SwitingBloc extends Bloc<SwitingEvent, SwitingState> {
  SwitingBloc() : super(const SwitingState(switching: false)) {
    on<SwitchOnOrOff>(_toggleSwitch);
    on<SliderChanged>(_sliderChanger);
  }

  void _toggleSwitch(SwitchOnOrOff event, Emitter<SwitingState> emit) {
    emit(state.copyWith(switching: !state.switching));
  }

  void _sliderChanger(SliderChanged event, Emitter<SwitingState> emit) {
    emit(state.copyWith(sliderValue: event.value));
  }

}
