import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuItem {
  home,
  proVersion,
  shop,
  lexikon,
  registieren,
  login,
  settings,
  datenschutz,
  faq,
  impressum,
  newsletter,
  instagram,
  facebook,
  youtube,
}
enum HomeMenuItem {
  home,
  kategorien,
  pruefungsmodus,
  gemerkteFragen,
  falschBeantwortete,
  frageSuche,
  virtuellesLehrbuch,
  karteikarten,
}
class NavigationCubit extends Cubit<MenuItem> {
  NavigationCubit() : super(MenuItem.home);
  void selectMenu(MenuItem item) => emit(item);
}

class NavigationHome extends Cubit<HomeMenuItem> {
  NavigationHome() : super(HomeMenuItem.home);
  void selectHomeMenu(HomeMenuItem item) => emit(item);
}
