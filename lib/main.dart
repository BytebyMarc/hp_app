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

  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (_) => NavigationCubit(),
    child: MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => NavigationCubit()),
      BlocProvider(create: (_) => NavigationHome()),
      BlocProvider(create: (_) => LexikonBloc()..add(LoadLexikon())),
        ], child: const MyApp())
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Hppsy Prüfungstrainer',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeState.themeMode,
          home: const BurgerMenu(),
        );
      },
    );
  }
}

