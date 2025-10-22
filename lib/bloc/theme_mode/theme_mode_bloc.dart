import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:present_unit_flutter/helpers/extension/string_print.dart';

part 'theme_mode_event.dart';

part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(ThemeModeState(isDarkMode: true)) {
    on<ToggleThemeModeEvent>((event, emit) {
      "${state.isDarkMode}".logOnString("isDarkMode");
      emit(state.copyWith(isDarkMode: !state.isDarkMode));
    });
  }
}
