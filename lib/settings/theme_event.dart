import 'package:flutter/material.dart';
import 'theme_bloc.dart';
import 'package:equatable/equatable.dart';

@immutable
sealed class ThemeEvent extends Equatable{
const ThemeEvent();

@override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent{}

class SystemThemeEvent extends ThemeEvent{}
