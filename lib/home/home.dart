import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/home/categoryPage/categoryPage.dart';
import 'package:hp_app/home/falseQuestions/falseQuestion.dart';
import 'package:hp_app/home/indexCards/indexCards.dart';
import 'package:hp_app/home/originalExamen/originalExamen.dart';
import 'package:hp_app/home/randomQuestion/randomQuestion.dart';
import 'package:hp_app/home/savedQuestions/savedQuestions.dart';
import 'package:hp_app/home/searchQuestion/searchQuestion.dart';
import 'package:hp_app/home/vitualLearnBook/vitualLearnBook.dart';
import 'package:hp_app/navigation_cubit.dart';


/// Steuert das Untermenü auf dem Home-Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationHome, HomeMenuItem>(
      builder: (context, state) {
        switch (state) {
          case HomeMenuItem.home:
            return _HomeMenuList();
          case HomeMenuItem.kategorien:
            return CategoryPage();
          case HomeMenuItem.randomQuestion:
            return RandomQuestion();
          case HomeMenuItem.pruefungsmodus:
            return OriginalExamen();
          case HomeMenuItem.gemerkteFragen:
            return SavedQuestions();
          case HomeMenuItem.falschBeantwortete:
            return FalseQuestion();
          case HomeMenuItem.frageSuche:
            return SearchQuestion();
          case HomeMenuItem.virtuellesLehrbuch:
            return VirtualLearnBook();
          case HomeMenuItem.karteikarten:
            return IndexCards();
        }
      },
    );
  }
}

/// Die Card-Liste mit deinen Home-Untermenüpunkten
class _HomeMenuList extends StatelessWidget {
  final List<_Entry> _entries = [
    _Entry(HomeMenuItem.kategorien, 'Kategorien', 'Prüfungsfragen nach Kategorien', Icons.category),
    _Entry(HomeMenuItem.randomQuestion, 'Zufällige Frage', 'Fragen werden zufällig ausgewählt', Icons.category),
    _Entry(HomeMenuItem.pruefungsmodus, 'Prüfungsmodus', '20 amtliche Prüfungsbogen', Icons.assignment),
    _Entry(HomeMenuItem.gemerkteFragen, 'Gemerkte Fragen', '0 Fragen', Icons.bookmark),
    _Entry(HomeMenuItem.falschBeantwortete, 'Falsch beantwortete Fragen', '0 Fragen', Icons.error),
    _Entry(HomeMenuItem.frageSuche, 'Frage Suche', 'Fragenkatalog durchsuchen', Icons.search),
    _Entry(HomeMenuItem.virtuellesLehrbuch, 'Virtuelles Lehrbuch', 'Anschauliche & Theoretische Texte zu allen Prüfungsthemen', Icons.menu_book),
    _Entry(HomeMenuItem.karteikarten, 'Karteikarten', '0 Karteikarten', Icons.credit_card),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _entries.length,
      itemBuilder: (ctx, i) {
        final e = _entries[i];
        return Card(
          child: ListTile(
            leading: Icon(e.icon),
            title: Text(e.title, style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text(e.subtitle, style: Theme.of(context).textTheme.bodyMedium),
            trailing: Icon(Icons.chevron_right),
            onTap: () => context.read<NavigationHome>().selectHomeMenu(e.item),
          ),
        );
      },
    );
  }
}

class _Entry {
  final HomeMenuItem item;
  final String title, subtitle;
  final IconData icon;
  _Entry(this.item, this.title, this.subtitle, this.icon);
}
