class LexikonEntry {
  final String term;
  final String description;
  const LexikonEntry({
    required this.term,
    required this.description
});

  static const List<LexikonEntry> testEntries = [
    LexikonEntry(
      term: 'Heilpraktiker für Psychotherapie',
      description:
      'Ein Heilpraktiker für Psychotherapie ist eine Person, die psychische Störungen mittels nicht-medikamentöser Verfahren diagnostiziert und behandelt.',
    ),
    LexikonEntry(
      term: 'Psychotherapie',
      description:
      'Psychotherapie umfasst verschiedene psychologische Verfahren zur Behandlung seelischer Leiden und Störungen.',
    ),
    LexikonEntry(
      term: 'Gesetzliche Grundlagen',
      description:
      'Die Tätigkeit des Heilpraktikers für Psychotherapie basiert auf dem Heilpraktikergesetz von 1939.',
    ),
    LexikonEntry(
      term: 'Supervision',
      description:
      'Supervision ist ein berufsbezogenes Reflexionsverfahren, das die berufliche Weiterentwicklung fördert.',
    ),
    LexikonEntry(
      term: 'Ethik',
      description:
      'Ethische Grundsätze in der Psychotherapie umfassen Schweigepflicht, Patientenautonomie und Non-Malefizienz.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),
    LexikonEntry(
      term: 'Traumatherapie',
      description:
      'Traumatherapie behandelt die Folgen traumatischer Erlebnisse durch gezielte psychotherapeutische Verfahren.',
    ),

  ];


  Map<String, dynamic> toJson() => {
    'term': term,
    'description': description,
  };

  /// Erzeugt ein Objekt aus JSON-Daten
  factory LexikonEntry.fromJson(Map<String, dynamic> json) {
    return LexikonEntry(
      term: json['term'] as String,
      description: json['description'] as String,
    );
  }
}