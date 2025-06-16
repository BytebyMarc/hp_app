import 'package:flutter/material.dart';


@immutable
sealed class LexikonEvent {
  const LexikonEvent();
}

class LoadLexikon extends LexikonEvent{
  const LoadLexikon();
}
