import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// State of the theme: holds the current ThemeMode
class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState({required this.themeMode});

  @override
  List<Object?> get props => [themeMode];

  /// copy with override
  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }
}
