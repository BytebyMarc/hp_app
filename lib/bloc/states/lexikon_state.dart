import 'package:flutter/material.dart';
import 'package:hp_app/models/lexikon_entry_model.dart';

@immutable
sealed class LexikonState {
  const LexikonState();
}

class LexikonInitial extends LexikonState {
  const LexikonInitial();
}

class LexikonLoading extends LexikonState{
  const LexikonLoading();
}
class LexikonLoaded extends LexikonState{
  final List<LexikonEntry> entries;
  const LexikonLoaded(this.entries); // konstruktor
}
class LexikonError extends LexikonState {
  final String message;
  const LexikonError(this.message);
}

