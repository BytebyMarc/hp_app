import 'package:bloc/bloc.dart';

enum MenuItem { home, settings }

class NavigationCubit extends Cubit<MenuItem>{
  NavigationCubit() :  super(MenuItem.home);

  void selectMenu(MenuItem item) => emit(item);

}