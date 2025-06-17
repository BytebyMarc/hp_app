import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)){
    on<ToggleThemeEvent>(_onToggle);
    on<SystemThemeEvent>(_onSystem);
  }

  void _onToggle(ToggleThemeEvent event, Emitter<ThemeState> emit){
    final newMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newMode));
  }

  void _onSystem(SystemThemeEvent event, Emitter<ThemeState> emit){
    emit(state.copyWith(themeMode: ThemeMode.system));

  }


}

