import 'package:flutter/material.dart';
import '../blocs/settings_bloc.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class SettingEvent extends Equatable{
const SettingEvent();

@override
  List<Object> get props => [];
}

class ToggleThemeEvent extends SettingEvent{}

class SystemThemeEvent extends SettingEvent{}
