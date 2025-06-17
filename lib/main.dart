import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hp_app/BurgerMenu/BurgerMenu.dart';
import 'lexikon/lexikon_event.dart';
import 'navigation_cubit.dart';
import 'lexikon/lexikon_bloc.dart';
import 'settings/appTheme.dart';
import 'package:hp_app/settings/theme_bloc.dart';
import 'settings/theme_state.dart';




void main() {
  runApp(BlocProvider(
    create: (_) => NavigationCubit(),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => NavigationCubit()),
      BlocProvider(create: (_) => LexikonBloc()..add(LoadLexikon())),
        ], child: const MyApp())
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // BlocBuilder liefert hier den aktuellen ThemeState als zweiten Parameter
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Hppsy Prüfungstrainer',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          // Nutze themeState.themeMode – themeState ist nur hier sichtbar!
          themeMode: themeState.themeMode,
          home: const BurgerMenu(),
        );
      },
    );
  }
}

