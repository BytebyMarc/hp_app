import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hp_app/navigation_cubit.dart';

void main() {
  group('NavigationCubit', () {
    late NavigationCubit cubit;
    setUp(() {
      cubit = NavigationCubit();
    });
    tearDown(() {
      cubit.close();
    });
    test('initial state is MenuItem.home', () {
      expect(cubit.state, MenuItem.home);
    });

    blocTest<NavigationCubit, MenuItem>(
      'emits [proVersion] when select(proVersion) is called',
      build: () => NavigationCubit(),
      act: (c) => c.selectMenu(MenuItem.proVersion),
      expect: () => [MenuItem.proVersion],
    );
    blocTest<NavigationCubit, MenuItem>(
      'emits [shop] when select(shop) is called',
      build: () => NavigationCubit(),
      act: (c) => c.selectMenu(MenuItem.shop),
      expect: () => [MenuItem.shop],
    );
    blocTest<NavigationCubit, MenuItem>(
      'emits [settings] when select(settings) is called',
      build: () => NavigationCubit(),
      act: (c) => c.selectMenu(MenuItem.settings),
      expect: () => [MenuItem.settings],
    );


  });
}
