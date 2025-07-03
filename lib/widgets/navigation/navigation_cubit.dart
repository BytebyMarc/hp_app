import 'package:flutter_bloc/flutter_bloc.dart';

enum MenuItem {
  home,
  proVersion,
  shop,
  lexikon,
  registrieren,
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
  randomQuestion,
  pruefungsmodus,
  gemerkteFragen,
  falschBeantwortete,
  frageSuche,
  virtuellesLehrbuch,
  karteikarten,
  selectedCategory,
}
class NavigationCubit extends Cubit<MenuItem> {
  NavigationCubit() : super(MenuItem.home);
  void selectMenu(MenuItem item) => emit(item);
}

class NavigationHome extends Cubit<HomeMenuItem> {
  NavigationHome() : super(HomeMenuItem.home);
  void selectHomeMenu(HomeMenuItem item) => emit(item);
}

class NavigationCategory extends Cubit<NavigationCategoryState> {
  NavigationCategory()
      : super(NavigationCategoryState(menu: HomeMenuItem.home));
  // Speichere nur die ID
  void selectCategory(int idCategory) {
    emit(NavigationCategoryState(
      menu: HomeMenuItem.selectedCategory,
      categoryId: idCategory,
    ));
  }

  // Optional zurück
  void goHome() {
    emit(NavigationCategoryState(menu: HomeMenuItem.home));
  }
}

class NavigationCategoryState {
  final HomeMenuItem menu;
  final int? categoryId;

  NavigationCategoryState({
    required this.menu,
    this.categoryId,
  });
}




