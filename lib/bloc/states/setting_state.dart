import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// State of the theme: holds the current ThemeMode
class SettingState extends Equatable {
  final ThemeMode themeMode;

  const SettingState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];

  /// copy with override
  SettingState copyWith({ThemeMode? themeMode}) {
    return SettingState(themeMode: themeMode ?? this.themeMode);
  }
}
