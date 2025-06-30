import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/setting_event.dart';
import '../states/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {

  SettingBloc() : super(const SettingState(themeMode: ThemeMode.system)){
    on<ToggleThemeEvent>(_onToggle);
    on<SystemThemeEvent>(_onSystem);
  }

  void _onToggle(ToggleThemeEvent event, Emitter<SettingState> emit){
    final newMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newMode));
  }

  void _onSystem(SystemThemeEvent event, Emitter<SettingState> emit){
    emit(state.copyWith(themeMode: ThemeMode.system));

  }


}

