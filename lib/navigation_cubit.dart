import 'package:bloc/bloc.dart';

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

class NavigationCubit extends Cubit<MenuItem> {
  NavigationCubit() : super(MenuItem.home);

  void selectMenu(MenuItem item) => emit(item);
}
